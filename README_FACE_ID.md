# 🔐 Face ID Implementation Guide

## Overview
This guide explains how Face ID (facial recognition) works in the X-Calculator app, including practical implementation, supported devices, and technical details.

---

## 📚 Contents
- [Used Package](#-used-package)
- [Responsible Files](#-responsible-files)
- [How It Works](#-how-it-works)
- [Supported Devices](#-supported-devices)
- [Biometric Types](#-biometric-types)
- [Biometric States](#-biometric-states)
- [Error Messages](#-error-messages)
- [Data Storage](#-data-storage)
- [Workflow](#-workflow)
- [Security and Protection](#-security-and-protection)
- [Localized Messages](#-localized-messages)
- [System Requirements](#-system-requirements)
- [Practical Usage](#-practical-usage)
- [Advantages and Limitations](#-advantages-and-limitations)

---

## 📦 Used Package

```dart
import 'package:local_auth/local_auth.dart';
```

- **Package**: `local_auth` from Flutter
- **Purpose**: Supports all biometric types (Face ID, Touch ID, Fingerprint)
- **Platform**: Android & iOS

---

## 📁 Responsible Files

### 1. **BiometricAuthCubit** - Core logic
```
lib/features/startup/bloc/biometric_auth/biometric_auth_cubit.dart
```
- Contains all biometric-related operations
- Manages different biometric states
- Checks biometric availability on the device

### 2. **BiometricLoginButton** - Login UI
```
lib/features/login/presentation/widget/biometric_login_button.dart
```
- Biometric button on the login screen
- Handles biometric login flow
- Displays error messages

### 3. **FaceIdWidget** - Biometric settings
```
lib/features/setting/presentation/widget/profile_user_widgets/face_id_widget.dart
```
- Enable/disable biometric settings
- Tests biometrics before enabling
- Displays biometric status

---

## ⚙️ How It Works

### Step 1: Check biometric availability
```dart
Future<bool> isBiometricAvailable() async {
  final isSupported = await _localAuth.isDeviceSupported();
  final canCheckBiometrics = await _localAuth.canCheckBiometrics;
  final availableBiometrics = await _localAuth.getAvailableBiometrics();
  
  return isSupported && canCheckBiometrics && availableBiometrics.isNotEmpty;
}
```

**Required checks:**
- ✅ `isDeviceSupported()` - Does the device support biometrics?
- ✅ `canCheckBiometrics` - Can biometrics be checked?
- ✅ `getAvailableBiometrics()` - Are biometrics configured?

### Step 2: Check if biometrics are enabled in the app
```dart
Future<bool> isBiometricEnabled() async {
  return await LocalStorageHelper.isBiometricEnabled();
}
```

### Step 3: Biometric authentication process
```dart
Future<void> authenticateUser() async {
  final bool isAuthenticated = await _localAuth.authenticate(
    localizedReason: 'touch_sensor_to_authenticate'.tr(),
    options: const AuthenticationOptions(
      biometricOnly: true,    // biometrics only
      stickyAuth: true,       // remain active
      useErrorDialogs: true,  // show error dialogs
    ),
  );
}
```

---

## 📱 Supported Devices

### Android
- ✅ **Android 6.0+** (API level 23+)
- ✅ **Fingerprint Scanner** - fingerprint sensor
- ✅ **Face Unlock** - face unlock
- ✅ **Iris Scanner** - iris scanner

### iOS
- ✅ **iOS 8.0+** 
- ✅ **Touch ID** - fingerprint recognition
- ✅ **Face ID** - facial recognition
- ✅ **iPhone 5s+** (Touch ID)
- ✅ **iPhone X+** (Face ID)

---

## 🔍 Biometric Types

```dart
enum BiometricType {
  fingerprint,  // fingerprint
  face,         // facial recognition
  iris,         // iris
  weak,         // weak biometric
  strong,       // strong biometric
}
```

---

## 📊 Biometric States

### 1. Initial state
```dart
const factory BiometricAuthState.initial() = _Initial;
```

### 2. Loading state
```dart
const factory BiometricAuthState.loading() = _Loading;
```

### 3. Authentication succeeded
```dart
const factory BiometricAuthState.authenticated() = _Authenticated;
```

### 4. Authentication failed
```dart
const factory BiometricAuthState.failed() = _Failed;
```

### 5. Not supported
```dart
const factory BiometricAuthState.notSupported() = _NotSupported;
```

### 6. Error
```dart
const factory BiometricAuthState.error({required String error}) = _Error;
```

---

## ❌ Error Messages

### When biometrics are unavailable
```json
"face_id_not_available": "Biometrics are not available on this device. Make sure biometrics are set up in device settings."
```

### When biometrics are not enabled
```json
"face_id_not_enabled": "Biometrics are not enabled. Please enable them from settings."
```

### When authentication fails
```json
"face_id_authentication_failed": "Biometric authentication failed."
```

### Additional messages
```json
"biometric_setup_required": "Please set up biometrics in device settings first."
"biometric_not_configured": "Biometrics are not configured on this device."
```

---

## 💾 Data Storage

### LocalStorageHelper
```dart
// Enable biometrics
await LocalStorageHelper.setBiometricEnabled(true);

// Check biometric enabled state
bool isEnabled = await LocalStorageHelper.isBiometricEnabled();
```

### Used key
```dart
static const String biometricEnabled = 'biometric_enabled';
```

---

## 🔄 Workflow

### On the login screen
1. Check biometric availability on the device
2. Check if biometrics are enabled in the app
3. Show the biometric button if available
4. On press: start authentication
5. On success: log in automatically

### On the settings screen
1. Check biometric availability on the device
2. Show biometric status (enabled/disabled)
3. On enable: test biometrics first
4. On success: save preference

---


## 🔒 Security and Protection

### Security options
```dart
options: const AuthenticationOptions(
  biometricOnly: true,    // biometrics only
  stickyAuth: true,       // remain active
  useErrorDialogs: true,  // show error dialogs
)
```

### Double-check process
- Check biometric availability on the device
- Check if biometrics are enabled in the app
- Test biometrics before enabling

---

## 🌐 Localized Messages

### Arabic
```json
{
  "face_id": "Face recognition",
  "login_with_face_id": "Log in with biometrics",
  "use_face_id_to_login": "Use biometrics to log in",
  "face_id_not_available": "Biometrics are not available on this device",
  "face_id_not_enabled": "Biometrics are not enabled, please enable them from settings",
  "face_id_authentication_failed": "Biometric authentication failed",
  "enable_face_id": "Enable biometrics",
  "disable_face_id": "Disable biometrics",
  "face_id_enabled": "Biometrics enabled",
  "face_id_disabled": "Biometrics disabled",
  "touch_sensor_to_authenticate": "Touch the sensor to authenticate",
  "do_you_want_to_enable_face_id": "Do you want to enable biometrics?",
  "do_you_want_to_disable_face_id": "Do you want to disable biometrics?",
  "face_id_authentication_successful": "Biometric authentication succeeded"
}
```

---

## ⚙️ System Requirements

### Android
```xml
<!-- Required permissions -->
<uses-permission android:name="android.permission.USE_FINGERPRINT" />
<uses-permission android:name="android.permission.USE_BIOMETRIC" />

<!-- System requirements -->
<uses-sdk android:minSdkVersion="23" android:targetSdkVersion="33" />
```

### iOS
```xml
<!-- في Info.plist -->
<key>NSFaceIDUsageDescription</key>
<string>This app uses Face ID for secure authentication</string>

<!-- System requirements -->
iOS 8.0+
```

---

## 👤 Practical Usage

### For users

#### 1. Set up biometrics on the device
- Go to device settings
- Search for "Biometrics" or "Face ID"
- Add a new biometric record
- Make sure it is enabled

#### 2. Enable biometrics in the app
- Go to app settings
- Tap "Face recognition"
- Follow the instructions

#### 3. Use biometrics
- On the login screen
- Tap the biometric button
- Touch the sensor

### For developers

#### 1. Add dependency
```yaml
dependencies:
  local_auth: ^2.1.6
```

#### 2. Register `Cubit`
```dart
getIt.registerLazySingleton<BiometricAuthCubit>(() => BiometricAuthCubit());
```

#### 3. Use in UI
```dart
BlocListener<BiometricAuthCubit, BiometricAuthState>(
  listener: (context, state) {
    state.when(
      authenticated: () => // login
      failed: () => // authentication failed
      error: (error) => // error
    );
  },
  child: // UI
)
```


---

## ✅ Advantages

- **High security** - biometrics are unique per person
- **Fast** - quick login
- **Easy** - no password needed
- **Comprehensive support** - all biometric types
- **Clear messages** - better user guidance
- **Smooth experience** - user-friendly interface

---

## ❌ Limitations

- **Requires a device with biometric support**
- **Needs initial setup**
- **May fail in some scenarios**
- **Requires special permissions**
- **Does not work on older devices**

---

## 🐛 Troubleshooting

### Common issues

#### 1. "Biometrics are not available on this device"
**Solution:**
- Make sure the device supports biometrics
- Check biometric setup in device settings
- Ensure biometrics are configured and enabled

#### 2. "Biometrics are not enabled"
**Solution:**
- Go to app settings
- Enable biometrics from there
- Test biometrics before enabling

#### 3. "Biometric authentication failed"
**Solution:**
- Make sure the biometric input is correct
- Clean the sensor
- Try another fingerprint/face scan

### Diagnostic information
```dart
printInfo('Biometric check results:');
printInfo('  - Device supported: $isSupported');
printInfo('  - Can check biometrics: $canCheckBiometrics');
printInfo('  - Available biometrics: $availableBiometrics');
```

---

## 📝 Important Notes

1. **Security**: Biometric data is stored locally on the device only.
2. **Privacy**: Biometric data is never sent to any server.
3. **Backup**: Biometrics should not replace password backup options.
4. **Compatibility**: Works on all supported devices.

---

## 🔗 Useful Links

- [Flutter Local Auth Documentation](https://pub.dev/packages/local_auth)
- [Android Biometric Authentication](https://developer.android.com/guide/topics/security/biometric)
- [iOS Face ID Documentation](https://developer.apple.com/documentation/localauthentication)

---

## 📞 Support

If you face any issues while implementing Face ID, please:
1. Check system requirements
2. Verify biometric setup on the device
3. Review error messages
4. Contact the support team

---

**This guide was created by the X-Calculator development team** 🚀
