# 🔐 Face ID Implementation Guide

## نظرة عامة
هذا الدليل يشرح آلية عمل Face ID (التعرف على الوجه) في تطبيق X-Calculator، بما في ذلك التطبيق العملي، الأجهزة المدعومة، والتفاصيل التقنية.

---

## 📚 المحتويات
- [المكتبة المستخدمة](#المكتبة-المستخدمة)
- [الملفات المسؤولة](#الملفات-المسؤولة)
- [آلية العمل](#آلية-العمل)
- [الأجهزة المدعومة](#الأجهزة-المدعومة)
- [أنواع البصمة](#أنواع-البصمة)
- [حالات البصمة](#حالات-البصمة)
- [رسائل الخطأ](#رسائل-الخطأ)
- [تخزين البيانات](#تخزين-البيانات)
- [تدفق العمل](#تدفق-العمل)
- [كلمة المرور الاحتياطية](#كلمة-المرور-الاحتياطية)
- [الأمان والحماية](#الأمان-والحماية)
- [الرسائل المحلية](#الرسائل-المحلية)
- [متطلبات النظام](#متطلبات-النظام)
- [الاستخدام العملي](#الاستخدام-العملي)
- [المزايا والقيود](#المزايا-والقيود)

---

## 📦 المكتبة المستخدمة

```dart
import 'package:local_auth/local_auth.dart';
```

- **المكتبة**: `local_auth` من Flutter
- **الوظيفة**: تدعم جميع أنواع البصمة (Face ID, Touch ID, Fingerprint)
- **المنصة**: Android & iOS

---

## 📁 الملفات المسؤولة

### 1. **BiometricAuthCubit** - المنطق الأساسي
```
lib/features/startup/bloc/biometric_auth/biometric_auth_cubit.dart
```
- يحتوي على جميع العمليات المتعلقة بالبصمة
- إدارة حالات البصمة المختلفة
- فحص توفر البصمة على الجهاز

### 2. **BiometricLoginButton** - واجهة تسجيل الدخول
```
lib/features/login/presentation/widget/biometric_login_button.dart
```
- زر البصمة في شاشة تسجيل الدخول
- معالجة عملية تسجيل الدخول بالبصمة
- عرض رسائل الخطأ

### 3. **FaceIdWidget** - إعدادات البصمة
```
lib/features/setting/presentation/widget/profile_user_widgets/face_id_widget.dart
```
- إعدادات تفعيل/إلغاء تفعيل البصمة
- اختبار البصمة قبل التفعيل
- عرض حالة البصمة

---

## ⚙️ آلية العمل

### الخطوة 1: فحص توفر البصمة
```dart
Future<bool> isBiometricAvailable() async {
  final isSupported = await _localAuth.isDeviceSupported();
  final canCheckBiometrics = await _localAuth.canCheckBiometrics;
  final availableBiometrics = await _localAuth.getAvailableBiometrics();
  
  return isSupported && canCheckBiometrics && availableBiometrics.isNotEmpty;
}
```

**الفحوصات المطلوبة:**
- ✅ `isDeviceSupported()` - هل الجهاز يدعم البصمة؟
- ✅ `canCheckBiometrics` - هل يمكن التحقق من البصمة؟
- ✅ `getAvailableBiometrics()` - هل هناك بصمات مُعدة؟

### الخطوة 2: فحص تفعيل البصمة في التطبيق
```dart
Future<bool> isBiometricEnabled() async {
  return await LocalStorageHelper.isBiometricEnabled();
}
```

### الخطوة 3: عملية التحقق من البصمة
```dart
Future<void> authenticateUser() async {
  final bool isAuthenticated = await _localAuth.authenticate(
    localizedReason: 'touch_sensor_to_authenticate'.tr(),
    options: const AuthenticationOptions(
      biometricOnly: true,    // البصمة فقط
      stickyAuth: true,       // البقاء مفعل
      useErrorDialogs: true,  // عرض رسائل الخطأ
    ),
  );
}
```

---

## 📱 الأجهزة المدعومة

### Android
- ✅ **Android 6.0+** (API level 23+)
- ✅ **Fingerprint Scanner** - مستشعر البصمة
- ✅ **Face Unlock** - فتح الوجه
- ✅ **Iris Scanner** - مستشعر القزحية

### iOS
- ✅ **iOS 8.0+** 
- ✅ **Touch ID** - بصمة الإصبع
- ✅ **Face ID** - التعرف على الوجه
- ✅ **iPhone 5s+** (Touch ID)
- ✅ **iPhone X+** (Face ID)

---

## 🔍 أنواع البصمة

```dart
enum BiometricType {
  fingerprint,  // بصمة الإصبع
  face,         // التعرف على الوجه
  iris,         // القزحية
  weak,         // بصمة ضعيفة
  strong,       // بصمة قوية
}
```

---

## 📊 حالات البصمة

### 1. الحالة الأولية
```dart
const factory BiometricAuthState.initial() = _Initial;
```

### 2. حالة التحميل
```dart
const factory BiometricAuthState.loading() = _Loading;
```

### 3. نجح التحقق
```dart
const factory BiometricAuthState.authenticated() = _Authenticated;
```

### 4. فشل التحقق
```dart
const factory BiometricAuthState.failed() = _Failed;
```

### 5. غير مدعوم
```dart
const factory BiometricAuthState.notSupported() = _NotSupported;
```

### 6. خطأ
```dart
const factory BiometricAuthState.error({required String error}) = _Error;
```

---

## ❌ رسائل الخطأ

### عند عدم توفر البصمة
```json
"face_id_not_available": "البصمة غير متاحة على هذا الجهاز. تأكد من إعداد البصمة في إعدادات الجهاز"
```

### عند عدم تفعيل البصمة
```json
"face_id_not_enabled": "البصمة غير مفعلة، يرجى تفعيلها من الإعدادات"
```

### عند فشل التحقق
```json
"face_id_authentication_failed": "فشل في التحقق من البصمة"
```

### رسائل إضافية
```json
"biometric_setup_required": "يرجى إعداد البصمة في إعدادات الجهاز أولاً"
"biometric_not_configured": "البصمة غير مُعدة على هذا الجهاز"
```

---

## 💾 تخزين البيانات

### LocalStorageHelper
```dart
// تفعيل البصمة
await LocalStorageHelper.setBiometricEnabled(true);

// فحص تفعيل البصمة
bool isEnabled = await LocalStorageHelper.isBiometricEnabled();
```

### المفتاح المستخدم
```dart
static const String biometricEnabled = 'biometric_enabled';
```

---

## 🔄 تدفق العمل

### في شاشة تسجيل الدخول
1. فحص توفر البصمة على الجهاز
2. فحص تفعيل البصمة في التطبيق
3. عرض زر البصمة إذا كانت متاحة
4. عند الضغط: بدء عملية التحقق
5. عند النجاح: تسجيل الدخول تلقائياً

### في شاشة الإعدادات
1. فحص توفر البصمة على الجهاز
2. عرض حالة البصمة (مفعلة/غير مفعلة)
3. عند التفعيل: اختبار البصمة أولاً
4. عند النجاح: حفظ التفضيل

---

## 🔑 كلمة المرور الاحتياطية

### نظرة عامة
كلمة المرور الاحتياطية هي آلية أمان إضافية تُطلب عند أول تفعيل للـ Face ID، وتُستخدم كبديل آمن عند فشل البصمة أو عدم توفرها.

### متى تُطلب كلمة المرور الاحتياطية؟
- ✅ **عند أول تفعيل للـ Face ID**
- ✅ **عند إعادة تعيين كلمة المرور**
- ✅ **عند تغيير الجهاز**

### متى تُستخدم كلمة المرور الاحتياطية؟
- 🔄 **فشل Face ID** - عند فشل التحقق من البصمة
- 🔄 **تغيير الوجه** - عند تغيير مظهر الوجه
- 🔄 **فشل المستشعر** - عند تلف أو تعطل المستشعر
- 🔄 **إلغاء تفعيل البصمة** - من إعدادات الجهاز
- 🔄 **تسجيل الدخول على جهاز جديد** - لا يدعم Face ID

### خصائص كلمة المرور الاحتياطية
```dart
// الحد الأدنى: 4 أرقام
// الحد الأقصى: 6 أرقام
// النوع: أرقام فقط
// التشفير: محفوظة محلياً في SharedPreferences
```

### الملفات المسؤولة عن كلمة المرور الاحتياطية

#### 1. **BackupPasswordDialog** - إنشاء كلمة المرور
```
lib/features/login/presentation/widget/backup_password_dialog.dart
```
- واجهة إنشاء كلمة المرور الاحتياطية
- التحقق من صحة كلمة المرور
- تأكيد كلمة المرور

#### 2. **BackupPasswordLoginDialog** - تسجيل الدخول
```
lib/features/login/presentation/widget/backup_password_login_dialog.dart
```
- واجهة تسجيل الدخول بكلمة المرور الاحتياطية
- إعادة تعيين كلمة المرور
- التحقق من صحة كلمة المرور

### طرق LocalStorageHelper لكلمة المرور الاحتياطية
```dart
// حفظ كلمة المرور الاحتياطية
await LocalStorageHelper.setBackupPassword("1234");

// الحصول على كلمة المرور الاحتياطية
String? password = await LocalStorageHelper.getBackupPassword();

// فحص وجود كلمة المرور الاحتياطية
bool hasPassword = await LocalStorageHelper.hasBackupPassword();

// التحقق من صحة كلمة المرور
bool isValid = await LocalStorageHelper.verifyBackupPassword("1234");

// حذف كلمة المرور الاحتياطية
await LocalStorageHelper.clearBackupPassword();
```

### تدفق إنشاء كلمة المرور الاحتياطية
1. **المستخدم يفعّل Face ID**
2. **فحص وجود كلمة مرور احتياطية**
3. **إذا لم تكن موجودة:**
   - عرض واجهة إنشاء كلمة المرور
   - طلب كلمة مرور (4-6 أرقام)
   - طلب تأكيد كلمة المرور
   - حفظ كلمة المرور محلياً
4. **تفعيل Face ID**

### تدفق تسجيل الدخول بكلمة المرور الاحتياطية
1. **فشل Face ID أو عدم توفرها**
2. **عرض خيار "تسجيل الدخول بكلمة المرور الاحتياطية"**
3. **إدخال كلمة المرور الاحتياطية**
4. **التحقق من صحة كلمة المرور**
5. **تسجيل الدخول بنجاح**

### رسائل كلمة المرور الاحتياطية
```json
{
  "backup_password_required": "كلمة مرور احتياطية مطلوبة",
  "create_backup_password": "إنشاء كلمة مرور احتياطية",
  "backup_password_description": "لضمان أمان حسابك، يرجى إنشاء كلمة مرور احتياطية للاستخدام عند عدم توفر البصمة",
  "enter_backup_password": "أدخل كلمة المرور الاحتياطية",
  "confirm_backup_password": "تأكيد كلمة المرور الاحتياطية",
  "backup_password_created": "تم إنشاء كلمة المرور الاحتياطية بنجاح",
  "backup_password_mismatch": "كلمة المرور غير متطابقة",
  "backup_password_too_short": "كلمة المرور قصيرة جداً (الحد الأدنى 4 أرقام)",
  "backup_password_invalid": "كلمة المرور غير صحيحة",
  "login_with_backup_password": "تسجيل الدخول بكلمة المرور الاحتياطية",
  "forgot_backup_password": "نسيت كلمة المرور الاحتياطية؟",
  "reset_backup_password": "إعادة تعيين كلمة المرور الاحتياطية",
  "backup_password_reset_success": "تم إعادة تعيين كلمة المرور الاحتياطية"
}
```

### الأمان في كلمة المرور الاحتياطية
- ✅ **محفوظة محلياً** - لا تُرسل لأي خادم
- ✅ **مشفرة** - محفوظة في SharedPreferences
- ✅ **فريدة لكل جهاز** - لا تنتقل بين الأجهزة
- ✅ **قابلة للإعادة تعيين** - يمكن تغييرها في أي وقت
- ✅ **تحقق مزدوج** - تأكيد كلمة المرور عند الإنشاء

---

## 🔒 الأمان والحماية

### خيارات الأمان
```dart
options: const AuthenticationOptions(
  biometricOnly: true,    // البصمة فقط
  stickyAuth: true,       // البقاء مفعل
  useErrorDialogs: true,  // عرض رسائل الخطأ
)
```

### التحقق المزدوج
- فحص توفر البصمة على الجهاز
- فحص تفعيل البصمة في التطبيق
- اختبار البصمة قبل التفعيل

---

## 🌐 الرسائل المحلية

### العربية
```json
{
  "face_id": "التعرف على الوجه",
  "login_with_face_id": "تسجيل الدخول بالبصمة",
  "use_face_id_to_login": "استخدم البصمة لتسجيل الدخول",
  "face_id_not_available": "البصمة غير متاحة على هذا الجهاز",
  "face_id_not_enabled": "البصمة غير مفعلة، يرجى تفعيلها من الإعدادات",
  "face_id_authentication_failed": "فشل في التحقق من البصمة",
  "enable_face_id": "تفعيل البصمة",
  "disable_face_id": "إلغاء تفعيل البصمة",
  "face_id_enabled": "البصمة مفعلة",
  "face_id_disabled": "البصمة غير مفعلة",
  "touch_sensor_to_authenticate": "المس المستشعر للتحقق من الهوية",
  "do_you_want_to_enable_face_id": "هل تريد تفعيل البصمة؟",
  "do_you_want_to_disable_face_id": "هل تريد إلغاء تفعيل البصمة؟",
  "face_id_authentication_successful": "تم التحقق من البصمة بنجاح"
}
```

---

## ⚙️ متطلبات النظام

### Android
```xml
<!-- الأذونات المطلوبة -->
<uses-permission android:name="android.permission.USE_FINGERPRINT" />
<uses-permission android:name="android.permission.USE_BIOMETRIC" />

<!-- متطلبات النظام -->
<uses-sdk android:minSdkVersion="23" android:targetSdkVersion="33" />
```

### iOS
```xml
<!-- في Info.plist -->
<key>NSFaceIDUsageDescription</key>
<string>This app uses Face ID for secure authentication</string>

<!-- متطلبات النظام -->
iOS 8.0+
```

---

## 👤 الاستخدام العملي

### للمستخدم

#### 1. إعداد البصمة في الجهاز
- اذهب إلى إعدادات الجهاز
- ابحث عن "البصمة" أو "Face ID"
- أضف بصمة جديدة
- تأكد من تفعيلها

#### 2. تفعيل البصمة في التطبيق
- اذهب إلى إعدادات التطبيق
- اضغط على "التعرف على الوجه"
- **إنشاء كلمة مرور احتياطية** (مطلوبة عند أول تفعيل)
- اتبع التعليمات

#### 3. استخدام البصمة
- في شاشة تسجيل الدخول
- اضغط على زر البصمة
- المس المستشعر

#### 4. استخدام كلمة المرور الاحتياطية
- عند فشل البصمة أو عدم توفرها
- اضغط على "تسجيل الدخول بكلمة المرور الاحتياطية"
- أدخل كلمة المرور الاحتياطية (4-6 أرقام)
- اضغط على "تسجيل الدخول"

#### 5. إعادة تعيين كلمة المرور الاحتياطية
- في واجهة تسجيل الدخول بكلمة المرور الاحتياطية
- اضغط على "نسيت كلمة المرور الاحتياطية؟"
- أدخل كلمة مرور جديدة
- أكد كلمة المرور الجديدة

### للمطور

#### 1. إضافة المكتبة
```yaml
dependencies:
  local_auth: ^2.1.6
```

#### 2. تسجيل Cubit
```dart
getIt.registerLazySingleton<BiometricAuthCubit>(() => BiometricAuthCubit());
```

#### 3. استخدام في الواجهة
```dart
BlocListener<BiometricAuthCubit, BiometricAuthState>(
  listener: (context, state) {
    state.when(
      authenticated: () => // تسجيل الدخول
      failed: () => // فشل التحقق
      error: (error) => // خطأ
    );
  },
  child: // واجهة المستخدم
)
```

#### 4. إضافة كلمة المرور الاحتياطية
```dart
// فحص وجود كلمة مرور احتياطية
bool hasBackupPassword = await LocalStorageHelper.hasBackupPassword();

// إنشاء كلمة مرور احتياطية
await LocalStorageHelper.setBackupPassword("1234");

// التحقق من كلمة المرور الاحتياطية
bool isValid = await LocalStorageHelper.verifyBackupPassword("1234");

// تسجيل الدخول بكلمة المرور الاحتياطية
authCubit.submitBackupPasswordLogin("1234");
```

#### 5. عرض واجهة كلمة المرور الاحتياطية
```dart
// إنشاء كلمة مرور احتياطية
showDialog(
  context: context,
  builder: (context) => BackupPasswordDialog(
    onSuccess: () {
      // تم إنشاء كلمة المرور بنجاح
    },
  ),
);

// تسجيل الدخول بكلمة المرور الاحتياطية
showDialog(
  context: context,
  builder: (context) => BackupPasswordLoginDialog(
    onSuccess: () {
      // تم تسجيل الدخول بنجاح
    },
  ),
);
```

---

## ✅ المزايا

- **أمان عالي** - البصمة فريدة لكل شخص
- **سرعة** - تسجيل دخول سريع
- **سهولة** - لا حاجة لكلمة مرور
- **دعم شامل** - جميع أنواع البصمة
- **رسائل واضحة** - توجيه المستخدم
- **تجربة سلسة** - واجهة سهلة الاستخدام
- **كلمة مرور احتياطية** - بديل آمن عند فشل البصمة
- **مرونة** - يعمل حتى عند تعطل المستشعر
- **استمرارية** - لا انقطاع في الخدمة

---

## ❌ القيود

- **يتطلب جهاز يدعم البصمة**
- **يحتاج إعداد مسبق**
- **قد يفشل في بعض الحالات**
- **يتطلب أذونات خاصة**
- **لا يعمل على الأجهزة القديمة**

---

## 🐛 استكشاف الأخطاء

### المشاكل الشائعة

#### 1. "البصمة غير متاحة على هذا الجهاز"
**الحل:**
- تأكد من أن الجهاز يدعم البصمة
- تحقق من إعداد البصمة في إعدادات الجهاز
- تأكد من أن البصمة مُعدة ومفعلة

#### 2. "البصمة غير مفعلة"
**الحل:**
- اذهب إلى إعدادات التطبيق
- فعّل البصمة من هناك
- اختبر البصمة قبل التفعيل

#### 3. "فشل في التحقق من البصمة"
**الحل:**
- تأكد من أن البصمة صحيحة
- نظف المستشعر
- جرب بصمة أخرى
- استخدم كلمة المرور الاحتياطية

#### 4. "كلمة المرور الاحتياطية غير صحيحة"
**الحل:**
- تأكد من إدخال كلمة المرور الصحيحة
- جرب كلمة مرور أخرى
- استخدم "نسيت كلمة المرور الاحتياطية؟"

#### 5. "نسيت كلمة المرور الاحتياطية"
**الحل:**
- اضغط على "نسيت كلمة المرور الاحتياطية؟"
- أنشئ كلمة مرور جديدة
- تأكد من حفظ كلمة المرور الجديدة

### معلومات التشخيص
```dart
printInfo('Biometric check results:');
printInfo('  - Device supported: $isSupported');
printInfo('  - Can check biometrics: $canCheckBiometrics');
printInfo('  - Available biometrics: $availableBiometrics');
```

---

## 📝 ملاحظات مهمة

1. **الأمان**: البصمة محفوظة محلياً على الجهاز فقط
2. **الخصوصية**: لا يتم إرسال بيانات البصمة لأي خادم
3. **النسخ الاحتياطي**: البصمة لا تعمل كبديل لكلمة المرور
4. **التوافق**: يعمل على جميع الأجهزة المدعومة
5. **كلمة المرور الاحتياطية**: مطلوبة عند أول تفعيل للبصمة
6. **الأمان المزدوج**: البصمة + كلمة المرور الاحتياطية
7. **المرونة**: يعمل حتى عند تعطل المستشعر
8. **الاستمرارية**: لا انقطاع في الخدمة

---

## 🔗 روابط مفيدة

- [Flutter Local Auth Documentation](https://pub.dev/packages/local_auth)
- [Android Biometric Authentication](https://developer.android.com/guide/topics/security/biometric)
- [iOS Face ID Documentation](https://developer.apple.com/documentation/localauthentication)

---

## 📞 الدعم

إذا واجهت أي مشاكل في تطبيق Face ID، يرجى:
1. التحقق من متطلبات النظام
2. التأكد من إعداد البصمة في الجهاز
3. مراجعة رسائل الخطأ
4. الاتصال بفريق الدعم

---

**تم إنشاء هذا الدليل بواسطة فريق تطوير X-Calculator** 🚀
