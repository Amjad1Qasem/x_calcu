import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:x_calcu/features/login/cubit/auth_cubit.dart';
import 'package:x_calcu/features/startup/bloc/biometric_auth/biometric_auth_cubit.dart';
import 'package:x_calcu/global/components/user_messages/snack_bar.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';
import 'package:x_calcu/global/utils/helper/local_storage_helper.dart';

class BiometricLoginButton extends StatefulWidget {
  const BiometricLoginButton({super.key});

  @override
  State<BiometricLoginButton> createState() => _BiometricLoginButtonState();
}

class _BiometricLoginButtonState extends State<BiometricLoginButton> {
  late final BiometricAuthCubit _biometricCubit;
  late final AuthCubit _authCubit;
  bool _isBiometricAvailable = false;
  bool _isBiometricEnabled = false;

  @override
  void initState() {
    super.initState();
    _initializeCubits();
    _checkBiometricStatus();
  }

  /// **Initialize Cubits**
  void _initializeCubits() {
    _biometricCubit = getIt<BiometricAuthCubit>();
    _authCubit = getIt<AuthCubit>();
  }

  /// **Check Biometric Status**
  Future<void> _checkBiometricStatus() async {
    final isAvailable = await _biometricCubit.isBiometricAvailable();
    final isEnabled = await _biometricCubit.isBiometricEnabled();

    if (mounted) {
      setState(() {
        _isBiometricAvailable = isAvailable;
        _isBiometricEnabled = isEnabled;
      });
    }
  }

  /// **Handle Biometric Login Button Tap**
  Future<void> _handleBiometricLogin() async {
    if (!_isBiometricAvailable) {
      _showErrorSnackBar('face_id_not_available'.tr());
      return;
    }

    if (!_isBiometricEnabled) {
      _showErrorSnackBar('face_id_not_enabled'.tr());
      return;
    }

    await _processBiometricLogin();
  }

  /// **Process Biometric Login with Saved Credentials**
  Future<void> _processBiometricLogin() async {
    try {
      final savedCredentials = await _getSavedCredentials();

      if (savedCredentials != null) {
        await _startBiometricAuthentication();
      } else {
        _showErrorSnackBar('no_saved_accounts'.tr());
      }
    } catch (e) {
      printError('Error processing biometric login: $e');
      _showErrorSnackBar('error_loading_accounts'.tr());
    }
  }

  /// **Get Saved Credentials**
  Future<({String username, String password})?> _getSavedCredentials() async {
    final username = await LocalStorageHelper.getSavedUsername();
    final password = await LocalStorageHelper.getSavedPassword();

    if (username != null && password != null) {
      return (username: username, password: password);
    }
    return null;
  }

  /// **Start Biometric Authentication**
  Future<void> _startBiometricAuthentication() async {
    await _biometricCubit.authenticateUser();
  }

  /// **Login with Saved Credentials (called after successful biometric auth)**
  Future<void> _loginWithSavedCredentials() async {
    try {
      final savedCredentials = await _getSavedCredentials();

      if (savedCredentials != null) {
        _autoFillFormFields(savedCredentials);
        _authCubit.submitLogin();
      } else {
        _authCubit.submitBiometricLogin();
      }
    } catch (e) {
      printError('Error logging in with saved credentials: $e');
      _showErrorSnackBar('login_failed'.tr());
    }
  }

  /// **Auto-fill Form Fields**
  void _autoFillFormFields(({String username, String password}) credentials) {
    _authCubit.emailCont.text = credentials.username;
    _authCubit.passwordCont.text = credentials.password;
  }

  /// **Show Error SnackBar**
  void _showErrorSnackBar(String message) {
    snackBar(context: context, title: message, isErrorMessage: true);
  }

  /// **Handle Biometric Auth State Changes**
  void _handleBiometricAuthState(BiometricAuthState state) {
    state.when(
      initial: () {},
      loading: () {},
      authenticated: () async {
        await _loginWithSavedCredentials();
      },
      failed: () {
        _showErrorSnackBar('face_id_authentication_failed'.tr());
      },
      notSupported: () {
        _showErrorSnackBar('face_id_not_available'.tr());
      },
      error: (error) {
        if (error.contains('face_id_not_enabled')) {
          _showErrorSnackBar('face_id_not_enabled'.tr());
        } else {
          _showErrorSnackBar('face_id_authentication_failed'.tr());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Hide button if biometric is not available or not enabled
    if (!_isBiometricAvailable || !_isBiometricEnabled) {
      return const SizedBox.shrink();
    }

    return BlocListener<BiometricAuthCubit, BiometricAuthState>(
      bloc: _biometricCubit,
      listener: (context, state) => _handleBiometricAuthState(state),
      child: BlocBuilder<BiometricAuthCubit, BiometricAuthState>(
        bloc: _biometricCubit,
        builder: (context, state) {
          return _buildBiometricLoginSection(context, state);
        },
      ),
    );
  }

  /// **Build Biometric Login Section**
  Widget _buildBiometricLoginSection(
    BuildContext context,
    BiometricAuthState state,
  ) {
    final isLoading = state is Loading;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: _buildBiometricLoginButton(context, isLoading),
    );
  }

  /// **Build Biometric Login Button**
  Widget _buildBiometricLoginButton(BuildContext context, bool isLoading) {
    return GestureDetector(
      onTap: isLoading ? null : _handleBiometricLogin,
      child: Container(
        width: double.infinity,
        height: 40.h,
        decoration: BoxDecoration(
          color: Utils(context).primary.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: Utils(context).primary, width: 1.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButtonIcon(context, isLoading),
            SizedBox(width: 12.w),
            _buildButtonText(context),
          ],
        ),
      ),
    );
  }

  /// **Build Button Icon**
  Widget _buildButtonIcon(BuildContext context, bool isLoading) {
    if (isLoading) {
      return SizedBox(
        width: 16.w,
        height: 16.h,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(Utils(context).primary),
        ),
      );
    }

    return Icon(Iconsax.scan, color: Utils(context).primary, size: 20.sp);
  }

  /// **Build Button Text**
  Widget _buildButtonText(BuildContext context) {
    return Text(
      'login_with_face_id'.tr(),
      style: Utils(context).normalText.copyWith(
        color: Utils(context).primary,
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
