📱 x_calcu 

A modern mobile application built with Flutter for secure and professional mediation between individuals and businesses.

Key Features:

🔐 Secure Login with Email & Face ID (iOS compatible)

📁 Documented Transactions (Real Estate & Business Deals)

🧾 Auto-saved Operation Records with Attachments

📤 Share Transactions (individually or by date range) via social apps & email

⚙️ Admin-only Account Creation (via dashboard)

✨ Smooth Onboarding Experience

📲 Designed with modern UX principles and dark/light theme compatibility

Tech Stack:

Flutter + Bloc

Dio for API communication

SharedPreferences for local storage

Face ID / Biometric integration

Easy Localization

IconSax for clean and consistent icons

Target Platforms:

✅ iOS (App Store guidelines compliant)

----------------------------------------

## Run Guide

### 1) Prerequisites
- Flutter SDK (preferably a recent stable version compatible with this project)
- Dart SDK (included with Flutter)
- Android Studio or VS Code with the Flutter extension
- A real device for testing (strongly recommended for notifications and Face ID)
- Xcode on macOS when running on iOS

### 2) Install dependencies
From the project root:

```bash
flutter pub get
```

### 2.1) Run build_runner (if code generation is used)
Use this command to generate/update files (e.g., Freezed/JSON):

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 3) Verify environment
```bash
flutter doctor
```

Make sure all core items (Android toolchain / iOS toolchain / connected device) are ready before running.

### 4) Run the app
- Run in development mode:
```bash
flutter run
```

- Build a release APK:
```bash
flutter build apk --release
```

For iOS:
```bash
flutter build ios --release
```

### 5) Important permissions before testing

#### Android
- Ensure notification permissions are declared in `AndroidManifest.xml` (such as `POST_NOTIFICATIONS` and exact-alarm related permissions)
- Allow notifications for the app from system settings
- Disable battery optimization for the app if notifications are delayed or not delivered
- Do not rely only on the emulator when testing exact or background notifications

#### iOS
- Ensure the Face ID usage permission is configured in `Info.plist` (`NSFaceIDUsageDescription`)
- Enable notification permission when first prompted in the app
- Test on a real device (Face ID and notifications are not always reliable on Simulator)

### 6) Validate sensitive features
- **Notifications**: Test scheduling, background delivery, and behavior after device restart
- **Face ID / Biometrics**: Test enabling from settings, then login with fingerprint/face
- **PDF Sharing**: Test PDF generation and sharing via external apps

### 7) Important notes
- If you change any permission settings, reinstall the app on the device to ensure changes are applied

### 8) Detailed guides in this project
- Notification permissions setup: `README_NOTIFICATION_PERMISSIONS.md`
- Face ID guide: `README_FACE_ID.md`
- PDF generation and sharing guide: `PDF_Generation_Guide.md`
