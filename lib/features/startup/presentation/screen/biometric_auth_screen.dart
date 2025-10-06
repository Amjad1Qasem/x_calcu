import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:x_calcu/global/utils/helper/local_storage_helper.dart';
import 'package:x_calcu/global/utils/router/router_path.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:async';

class BiometricAuthScreen extends StatefulWidget {
  const BiometricAuthScreen({super.key});

  @override
  State<BiometricAuthScreen> createState() => _BiometricAuthScreenState();
}

class _BiometricAuthScreenState extends State<BiometricAuthScreen>
    with TickerProviderStateMixin {
  final LocalAuthentication _localAuth = LocalAuthentication();
  String _authStatus = '';
  bool _isLoading = false;
  bool _isRetrying = false;
  String _errorMessage = '';
  late AnimationController _iconAnimationController;
  late Animation<double> _iconScaleAnimation;
  late Animation<double> _iconFadeAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _checkBiometricsAndAuthenticate();
  }

  void _initializeAnimations() {
    _iconAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _iconScaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _iconAnimationController,
        curve: Curves.elasticOut,
      ),
    );

    _iconFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _iconAnimationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _iconAnimationController.dispose();
    super.dispose();
  }

  Future<void> _checkBiometricsAndAuthenticate() async {
    setState(() {
      _isLoading = true;
      _isRetrying = false;
      _authStatus = '';
      _errorMessage = '';
    });

    try {
      final bool isDeviceSupported = await _localAuth.isDeviceSupported();
      final bool canCheckBiometrics = await _localAuth.canCheckBiometrics;

      if (!isDeviceSupported || !canCheckBiometrics) {
        setState(() {
          _authStatus = 'biometric_not_configured'.tr();
          _errorMessage = 'biometric_setup_required'.tr();
          _isLoading = false;
        });
        return;
      }

      // Start icon animation
      _iconAnimationController.forward();

      // استخدام الدالة الجديدة بدون زر Cancel
      final bool authenticated = await _localAuth.authenticate(
        localizedReason: 'please_authenticate_to_continue'.tr(),
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
          sensitiveTransaction: true, // هذا يزيل زر Cancel
        ),
      );

      if (authenticated) {
        setState(() {
          _authStatus = 'authentication_successful'.tr();
          _isLoading = false;
        });

        // حفظ حالة المصادقة الحيوية
        await LocalStorageHelper.setBiometricEnabled(true);

        // الانتقال إلى الشاشة الرئيسية
        if (mounted) {
          context.go(RouterPath.homeScreen);
        }
      } else {
        setState(() {
          _authStatus = 'authentication_failed'.tr();
          _errorMessage = 'authentication_failed_message'.tr();
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _authStatus = 'authentication_error'.tr();
        _errorMessage = _getErrorMessage(e);
        _isLoading = false;
      });
    }
  }

  String _getErrorMessage(dynamic error) {
    if (error.toString().contains('NotAvailable')) {
      return 'biometric_not_available'.tr();
    } else if (error.toString().contains('NotEnrolled')) {
      return 'biometric_not_enrolled'.tr();
    } else if (error.toString().contains('LockedOut')) {
      return 'biometric_locked_out'.tr();
    } else if (error.toString().contains('PermanentlyLockedOut')) {
      return 'biometric_permanently_locked'.tr();
    } else {
      return 'authentication_error_message'.tr();
    }
  }

  Future<void> _retryAuthentication() async {
    if (_isRetrying) return; // Prevent multiple simultaneous attempts

    setState(() {
      _isRetrying = true;
    });

    // Add a small delay to prevent rapid retries
    await Future.delayed(const Duration(milliseconds: 500));

    await _checkBiometricsAndAuthenticate();

    setState(() {
      _isRetrying = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1C1C1E), Color(0xFF000000)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Top spacing
              const Spacer(flex: 2),

              // Main content
              _isLoading ? _buildLoadingState() : _buildAuthState(),

              // Bottom spacing
              const Spacer(flex: 3),

              // Bottom text
              if (!_isLoading)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'biometric_required_to_continue'.tr(),
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingState() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // iOS-style loading indicator
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white.withOpacity(0.3), width: 2),
          ),
          child: const Center(
            child: SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        Text(
          'biometric_required_to_continue'.tr(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildAuthState() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // iOS-style biometric icon with animation
        _buildBiometricIcon(),
        const SizedBox(height: 40),

        // Status text
        Text(
          _authStatus.isEmpty
              ? 'please_authenticate_to_continue'.tr()
              : _authStatus,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),

        // Error message if available
        if (_errorMessage.isNotEmpty) ...[
          const SizedBox(height: 12),
          Text(
            _errorMessage,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ],

        const SizedBox(height: 30),

        // Try again button (iOS style) - show when failed or error
        if (_authStatus.contains('failed') ||
            _authStatus.contains('error') ||
            _authStatus.contains('not_configured'))
          _buildTryAgainButton(),
      ],
    );
  }

  Widget _buildBiometricIcon() {
    return AnimatedBuilder(
      animation: _iconAnimationController,
      builder: (context, child) {
        return Transform.scale(
          scale: _iconScaleAnimation.value,
          child: FadeTransition(
            opacity: _iconFadeAnimation,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Colors.white.withOpacity(0.15),
                    Colors.white.withOpacity(0.05),
                  ],
                ),
                border: Border.all(
                  color: Colors.white.withOpacity(0.3),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: const Center(
                child: Icon(Icons.fingerprint, size: 60, color: Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTryAgainButton() {
    return Container(
      width: 200,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.1),
            Colors.white.withOpacity(0.05),
          ],
        ),
        border: Border.all(color: Colors.white.withOpacity(0.4), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: _isRetrying ? null : _retryAuthentication,
          child: Center(
            child:
                _isRetrying
                    ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                    : Text(
                      'try_again'.tr(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                      ),
                    ),
          ),
        ),
      ),
    );
  }
}
