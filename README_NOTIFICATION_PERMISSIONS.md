# إدارة أذونات الإشعارات - Notification Permissions Management

## نظرة عامة
تم إضافة نظام شامل لإدارة أذونات الإشعارات باستخدام `permission_handler` لضمان عمل الإشعارات بشكل صحيح على الأجهزة الحقيقية.

## الميزات المضافة

### 1. إضافة permission_handler
- تم إضافة `permission_handler: ^11.3.1` إلى `pubspec.yaml`
- يوفر إدارة شاملة للأذونات على Android و iOS

### 2. تحديث AndroidManifest.xml
تم إضافة الأذونات التالية:
```xml
<!-- أذونات الإشعارات الأساسية -->
<uses-permission android:name="android.permission.POST_NOTIFICATIONS" />
<uses-permission android:name="android.permission.SCHEDULE_EXACT_ALARM"/>
<uses-permission android:name="android.permission.USE_EXACT_ALARM"/>

<!-- أذونات إضافية للإشعارات في الخلفية -->
<uses-permission android:name="android.permission.WAKE_LOCK"/>
<uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
<uses-permission android:name="android.permission.VIBRATE"/>

<!-- أذونات إضافية لضمان عمل الإشعارات على الأجهزة الحقيقية -->
<uses-permission android:name="android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS" />
<uses-permission android:name="android.permission.SYSTEM_ALERT_WINDOW" />
<uses-permission android:name="android.permission.ACCESS_NOTIFICATION_POLICY" />
<uses-permission android:name="android.permission.DISABLE_KEYGUARD" />
<uses-permission android:name="android.permission.TURN_SCREEN_ON" />
```

### 3. تحديث NotificationService
تم إضافة الدوال التالية:

#### دوال فحص الأذونات:
- `checkAllNotificationPermissions()` - فحص جميع أذونات الإشعارات
- `requestAllNotificationPermissions()` - طلب جميع أذونات الإشعارات
- `areNotificationsEnabled()` - فحص أذونات الإشعارات (محدثة)
- `requestNotificationPermission()` - طلب أذونات الإشعارات (محدثة)

#### دوال اختبار:
- `testAllNotificationPermissions()` - اختبار جميع الأذونات
- `initializeWithPermissionChecks()` - تهيئة الخدمة مع فحص الأذونات

### 4. إضافة NotificationPermissionWidget
تم إنشاء widget جديد لإدارة الأذونات:
- فحص حالة الأذونات الحالية
- طلب الأذونات المطلوبة
- فتح إعدادات التطبيق
- عرض تفاصيل كل إذن

### 5. إضافة الترجمات
تم إضافة ترجمات عربية وإنجليزية للأذونات:
- `notification_permissions` - أذونات الإشعارات
- `checking_permissions` - جاري فحص الأذونات
- `request_permissions` - طلب الأذونات
- `open_settings` - فتح الإعدادات
- وغيرها...

## كيفية الاستخدام

### 1. فحص الأذونات
```dart
// فحص جميع الأذونات
final permissions = await NotificationService.checkAllNotificationPermissions();

// فحص حالة النظام
final systemStatus = await NotificationService.checkNotificationSystem();
```

### 2. طلب الأذونات
```dart
// طلب جميع الأذونات
final results = await NotificationService.requestAllNotificationPermissions();

// طلب أذونات الإشعارات فقط
final granted = await NotificationService.requestNotificationPermission();
```

### 3. استخدام Widget الأذونات
```dart
NotificationPermissionWidget(
  onPermissionGranted: () {
    // تم منح الأذونات
  },
  onPermissionDenied: () {
    // تم رفض الأذونات
  },
)
```

### 4. تهيئة الخدمة مع الأذونات
```dart
// تهيئة مع فحص الأذونات
await NotificationService.initializeWithPermissionChecks();

// أو التهيئة العادية
await NotificationService.init();
```

## الأذونات المطلوبة

### Android:
1. **POST_NOTIFICATIONS** - أذن الإشعارات الأساسي
2. **SCHEDULE_EXACT_ALARM** - أذن التنبيه الدقيق
3. **USE_EXACT_ALARM** - أذن استخدام التنبيه الدقيق
4. **WAKE_LOCK** - أذن إيقاظ الجهاز
5. **RECEIVE_BOOT_COMPLETED** - أذن استقبال إشارة بدء التشغيل
6. **VIBRATE** - أذن الاهتزاز
7. **REQUEST_IGNORE_BATTERY_OPTIMIZATIONS** - أذن تجاهل تحسين البطارية
8. **SYSTEM_ALERT_WINDOW** - أذن نافذة التنبيهات
9. **ACCESS_NOTIFICATION_POLICY** - أذن الوصول لسياسة الإشعارات
10. **DISABLE_KEYGUARD** - أذن تعطيل قفل الشاشة
11. **TURN_SCREEN_ON** - أذن تشغيل الشاشة

### iOS:
1. **Notification Permission** - أذن الإشعارات

## نصائح للاستخدام

### 1. فحص الأذونات قبل الجدولة
```dart
// فحص الأذونات قبل جدولة إشعار
final hasPermission = await NotificationService.areNotificationsEnabled();
if (hasPermission) {
  await NotificationService.scheduleNotification(...);
} else {
  // طلب الأذونات أو إظهار رسالة للمستخدم
}
```

### 2. التعامل مع رفض الأذونات
```dart
final results = await NotificationService.requestAllNotificationPermissions();
if (!results['notification_permission']) {
  // إظهار رسالة للمستخدم أو فتح الإعدادات
  await openAppSettings();
}
```

### 3. اختبار الأذونات
```dart
// اختبار شامل للأذونات
await NotificationService.testAllNotificationPermissions();

// اختبار النظام
await NotificationService.testNotificationSystemComprehensive();
```

## استكشاف الأخطاء

### مشاكل شائعة:
1. **الإشعارات لا تظهر على الأجهزة الحقيقية**
   - تأكد من منح أذن الإشعارات
   - تحقق من إعدادات تحسين البطارية
   - تأكد من تفعيل قنوات الإشعارات

2. **الإشعارات متأخرة**
   - تحقق من أذن التنبيه الدقيق
   - تأكد من تعطيل تحسين البطارية للتطبيق

3. **الإشعارات لا تعمل في الخلفية**
   - تحقق من أذن WAKE_LOCK
   - تأكد من إعدادات النظام

### أدوات التشخيص:
```dart
// فحص شامل للنظام
final status = await NotificationService.checkNotificationSystem();
print('System status: $status');

// اختبار الأذونات
await NotificationService.testAllNotificationPermissions();
```

## التحديثات المستقبلية

1. إضافة دعم لأذونات إضافية حسب الحاجة
2. تحسين واجهة إدارة الأذونات
3. إضافة إحصائيات استخدام الأذونات
4. دعم أذونات متقدمة للإشعارات التفاعلية

---

**ملاحظة:** تأكد من اختبار الإشعارات على أجهزة حقيقية بعد تطبيق هذه التحديثات.
