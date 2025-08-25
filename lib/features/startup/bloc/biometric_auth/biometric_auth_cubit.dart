import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:local_auth/local_auth.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';

part 'biometric_auth_state.dart';
part 'biometric_auth_cubit.freezed.dart';

class BiometricAuthCubit extends Cubit<BiometricAuthState> {
  BiometricAuthCubit() : super(const BiometricAuthState.initial());

  final LocalAuthentication _localAuth = LocalAuthentication();

  Future<void> authenticateUser() async {
    emit(const BiometricAuthState.loading());

    try {
      final isSupported = await _localAuth.isDeviceSupported();
      final canCheckBiometrics = await _localAuth.canCheckBiometrics;
      final availableBiometrics = await _localAuth.getAvailableBiometrics();

      printWarning('isSupported: $isSupported');
      printWarning('canCheckBiometrics: $canCheckBiometrics');
      printWarning('availableBiometrics: $availableBiometrics');

      if (!isSupported || !canCheckBiometrics || availableBiometrics.isEmpty) {
        emit(const BiometricAuthState.notSupported());
        return;
      }

      final bool isAuthenticated = await _localAuth.authenticate(
        localizedReason: 'Please authenticate to access your account',
        options: const AuthenticationOptions(
          biometricOnly: false,
          stickyAuth: true,
          useErrorDialogs: true,
        ),
      );

      if (isAuthenticated) {
        emit(const BiometricAuthState.authenticated());
      } else {
        emit(const BiometricAuthState.failed());
      }
    } catch (e, s) {
      printError('Biometric Error $e');
      emit(BiometricAuthState.error(error: e.toString()));
    }
  }
}
