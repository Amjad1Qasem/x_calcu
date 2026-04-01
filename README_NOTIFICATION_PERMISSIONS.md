# Notification Permissions Management

## Overview
A comprehensive notification permission management system has been added using `permission_handler` to ensure notifications work correctly on real devices.

## Added Features

### 1. Added `permission_handler`
- Added `permission_handler: ^11.3.1` to `pubspec.yaml`
- Provides comprehensive permission management on Android and iOS

### 2. Updated `AndroidManifest.xml`
The following permissions were added:
```xml
<!-- Core notification permissions -->
<uses-permission android:name="android.permission.POST_NOTIFICATIONS" />
<uses-permission android:name="android.permission.SCHEDULE_EXACT_ALARM"/>
<uses-permission android:name="android.permission.USE_EXACT_ALARM"/>

<!-- Extra permissions for background notifications -->
<uses-permission android:name="android.permission.WAKE_LOCK"/>
<uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
<uses-permission android:name="android.permission.VIBRATE"/>

<!-- Additional permissions to improve notification reliability on real devices -->
<uses-permission android:name="android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS" />
<uses-permission android:name="android.permission.SYSTEM_ALERT_WINDOW" />
<uses-permission android:name="android.permission.ACCESS_NOTIFICATION_POLICY" />
<uses-permission android:name="android.permission.DISABLE_KEYGUARD" />
<uses-permission android:name="android.permission.TURN_SCREEN_ON" />
```

### 3. Updated `NotificationService`
The following methods were added:

#### Permission checking methods:
- `checkAllNotificationPermissions()` - Check all notification permissions
- `requestAllNotificationPermissions()` - Request all notification permissions
- `areNotificationsEnabled()` - Check notification permission status (updated)
- `requestNotificationPermission()` - Request notification permissions (updated)

#### Testing methods:
- `testAllNotificationPermissions()` - Test all permissions
- `initializeWithPermissionChecks()` - Initialize the service with permission checks

### 4. Added `NotificationPermissionWidget`
A new widget was created to manage permissions:
- Check current permission status
- Request required permissions
- Open app settings
- Show details for each permission

### 5. Added translations
Arabic and English translations were added for permissions:
- `notification_permissions` - Notification permissions
- `checking_permissions` - Checking permissions
- `request_permissions` - Request permissions
- `open_settings` - Open settings
- And more...

## How to Use

### 1. Check permissions
```dart
// Check all permissions
final permissions = await NotificationService.checkAllNotificationPermissions();

// Check system status
final systemStatus = await NotificationService.checkNotificationSystem();
```

### 2. Request permissions
```dart
// Request all permissions
final results = await NotificationService.requestAllNotificationPermissions();

// Request notification permissions only
final granted = await NotificationService.requestNotificationPermission();
```

### 3. Use the permissions widget
```dart
NotificationPermissionWidget(
  onPermissionGranted: () {
    // Permissions granted
  },
  onPermissionDenied: () {
    // Permissions denied
  },
)
```

### 4. Initialize the service with permissions
```dart
// Initialize with permission checks
await NotificationService.initializeWithPermissionChecks();

// Or regular initialization
await NotificationService.init();
```

## Required Permissions

### Android:
1. **POST_NOTIFICATIONS** - Core notification permission
2. **SCHEDULE_EXACT_ALARM** - Exact alarm scheduling permission
3. **USE_EXACT_ALARM** - Exact alarm usage permission
4. **WAKE_LOCK** - Device wake lock permission
5. **RECEIVE_BOOT_COMPLETED** - Boot completed broadcast permission
6. **VIBRATE** - Vibration permission
7. **REQUEST_IGNORE_BATTERY_OPTIMIZATIONS** - Ignore battery optimizations permission
8. **SYSTEM_ALERT_WINDOW** - System alert window permission
9. **ACCESS_NOTIFICATION_POLICY** - Notification policy access permission
10. **DISABLE_KEYGUARD** - Disable lock screen permission
11. **TURN_SCREEN_ON** - Turn screen on permission

### iOS:
1. **Notification Permission** - Notification permission

## Usage Tips

### 1. Check permissions before scheduling
```dart
// Check permissions before scheduling a notification
final hasPermission = await NotificationService.areNotificationsEnabled();
if (hasPermission) {
  await NotificationService.scheduleNotification(...);
} else {
  // Request permissions or show a message to the user
}
```

### 2. Handle permission denial
```dart
final results = await NotificationService.requestAllNotificationPermissions();
if (!results['notification_permission']) {
  // Show a message to the user or open settings
  await openAppSettings();
}
```

### 3. Test permissions
```dart
// Comprehensive permission test
await NotificationService.testAllNotificationPermissions();

// System test
await NotificationService.testNotificationSystemComprehensive();
```

## Troubleshooting

### Common issues:
1. **Notifications do not appear on real devices**
   - Make sure notification permission is granted
   - Check battery optimization settings
   - Ensure notification channels are enabled

2. **Notifications are delayed**
   - Check exact alarm permission
   - Make sure battery optimization is disabled for the app

3. **Notifications do not work in background**
   - Check `WAKE_LOCK` permission
   - Verify system settings

### Diagnostic tools:
```dart
// Full system check
final status = await NotificationService.checkNotificationSystem();
print('System status: $status');

// Permission test
await NotificationService.testAllNotificationPermissions();
```

## Future Updates

1. Add support for additional permissions when needed
2. Improve the permission management UI
3. Add permission usage analytics
4. Support advanced permissions for interactive notifications

---

**Note:** Make sure to test notifications on real devices after applying these updates.
