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
- اتبع التعليمات

#### 3. استخدام البصمة
- في شاشة تسجيل الدخول
- اضغط على زر البصمة
- المس المستشعر

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


---

## ✅ المزايا

- **أمان عالي** - البصمة فريدة لكل شخص
- **سرعة** - تسجيل دخول سريع
- **سهولة** - لا حاجة لكلمة مرور
- **دعم شامل** - جميع أنواع البصمة
- **رسائل واضحة** - توجيه المستخدم
- **تجربة سلسة** - واجهة سهلة الاستخدام

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
