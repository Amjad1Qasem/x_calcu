import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:local_auth/local_auth.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';
import 'package:x_calcu/global/utils/helper/local_storage_helper.dart';

part 'biometric_auth_state.dart';
part 'biometric_auth_cubit.freezed.dart';

class BiometricAuthCubit extends Cubit<BiometricAuthState> {
  BiometricAuthCubit() : super(const BiometricAuthState.initial());

  final LocalAuthentication _localAuth = LocalAuthentication();

  /// Check if biometric authentication is available on the device
  Future<bool> isBiometricAvailable() async {
    try {
      final isSupported = await _localAuth.isDeviceSupported();
      final canCheckBiometrics = await _localAuth.canCheckBiometrics;
      final availableBiometrics = await _localAuth.getAvailableBiometrics();

      printInfo('Biometric check results:');
      printInfo('  - Device supported: $isSupported');
      printInfo('  - Can check biometrics: $canCheckBiometrics');
      printInfo('  - Available biometrics: $availableBiometrics');

      return isSupported &&
          canCheckBiometrics &&
          availableBiometrics.isNotEmpty;
    } catch (e) {
      printError('Error checking biometric availability: $e');
      return false;
    }
  }

  /// Check if biometric authentication is enabled in app settings
  Future<bool> isBiometricEnabled() async {
    return await LocalStorageHelper.isBiometricEnabled();
  }

  /// Check if backup password exists
  Future<bool> hasBackupPassword() async {
    return await LocalStorageHelper.hasBackupPassword();
  }

  /// Get available biometric types
  Future<List<BiometricType>> getAvailableBiometrics() async {
    try {
      return await _localAuth.getAvailableBiometrics();
    } catch (e) {
      printError('Error getting available biometrics: $e');
      return [];
    }
  }

  /// Authenticate user with biometric
  Future<void> authenticateUser() async {
    emit(const BiometricAuthState.loading());

    try {
      // Check if biometric is enabled in settings
      final isEnabled = await isBiometricEnabled();
      if (!isEnabled) {
        emit(BiometricAuthState.error(error: 'face_id_not_enabled'.tr()));
        return;
      }

      // Check if biometric is available on device
      final isAvailable = await isBiometricAvailable();
      if (!isAvailable) {
        // Get more detailed information about why biometric is not available
        final isSupported = await _localAuth.isDeviceSupported();
        final canCheckBiometrics = await _localAuth.canCheckBiometrics;
        final availableBiometrics = await _localAuth.getAvailableBiometrics();

        String errorMessage = 'face_id_not_available'.tr();
        if (!isSupported) {
          errorMessage = 'biometric_not_configured'.tr();
        } else if (!canCheckBiometrics) {
          errorMessage = 'biometric_setup_required'.tr();
        } else if (availableBiometrics.isEmpty) {
          errorMessage = 'biometric_setup_required'.tr();
        }

        emit(BiometricAuthState.error(error: errorMessage));
        return;
      }

      final availableBiometrics = await getAvailableBiometrics();
      printInfo('Available biometrics: $availableBiometrics');

      final bool isAuthenticated = await _localAuth.authenticate(
        localizedReason: 'touch_sensor_to_authenticate'.tr(),
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
          useErrorDialogs: true,
        ),
      );

      if (isAuthenticated) {
        printSuccess('Biometric authentication successful');
        emit(const BiometricAuthState.authenticated());
      } else {
        printWarning('Biometric authentication failed');
        emit(const BiometricAuthState.failed());
      }
    } catch (e, s) {
      printError('Biometric Error: $e');
      printError('Stack trace: $s');
      emit(BiometricAuthState.error(error: e.toString()));
    }
  }

  /// Enable biometric authentication
  Future<void> enableBiometric() async {
    try {
      await LocalStorageHelper.setBiometricEnabled(true);
      printSuccess('Biometric authentication enabled');
    } catch (e) {
      printError('Error enabling biometric: $e');
    }
  }

  /// Disable biometric authentication
  Future<void> disableBiometric() async {
    try {
      await LocalStorageHelper.setBiometricEnabled(false);
      printSuccess('Biometric authentication disabled');
    } catch (e) {
      printError('Error disabling biometric: $e');
    }
  }

  /// Check biometric status (available and enabled)
  Future<void> checkBiometricStatus() async {
    emit(const BiometricAuthState.loading());

    try {
      final isAvailable = await isBiometricAvailable();
      final isEnabled = await isBiometricEnabled();

      if (!isAvailable) {
        // Get more detailed information about why biometric is not available
        final isSupported = await _localAuth.isDeviceSupported();
        final canCheckBiometrics = await _localAuth.canCheckBiometrics;
        final availableBiometrics = await _localAuth.getAvailableBiometrics();

        String errorMessage = 'face_id_not_available'.tr();
        if (!isSupported) {
          errorMessage = 'biometric_not_configured'.tr();
        } else if (!canCheckBiometrics) {
          errorMessage = 'biometric_setup_required'.tr();
        } else if (availableBiometrics.isEmpty) {
          errorMessage = 'biometric_setup_required'.tr();
        }

        emit(BiometricAuthState.error(error: errorMessage));
      } else if (!isEnabled) {
        emit(BiometricAuthState.error(error: 'face_id_not_enabled'.tr()));
      } else {
        emit(const BiometricAuthState.initial());
      }
    } catch (e) {
      printError('Error checking biometric status: $e');
      emit(BiometricAuthState.error(error: e.toString()));
    }
  }
}
