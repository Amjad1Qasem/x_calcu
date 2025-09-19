# ShowcaseView Integration Guide

## نظرة عامة
تم دمج مكتبة `showcaseview: ^4.0.1` في التطبيق لتوفير برنامج تعليمي تفاعلي للمستخدمين الجدد.

## الملفات المضافة/المحدثة

### 1. الملفات الجديدة
- `lib/global/utils/showcase_helper.dart` - مساعد إدارة ShowcaseView
- `lib/global/components/showcase/showcase_button.dart` - مكونات ShowcaseView
- `README_SHOWCASE.md` - هذا الدليل

### 2. الملفات المحدثة
- `pubspec.yaml` - إضافة مكتبة showcaseview
- `lib/main.dart` - تهيئة ShowcaseHelper
- `lib/my_app.dart` - تضمين ShowCaseWidget
- `lib/features/home/presentation/widget/home_search_widget.dart` - إضافة showcase للبحث
- `lib/features/home/presentation/widget/filter_header_home_widget.dart` - إضافة showcase للتصفية
- `lib/features/home/presentation/widget/sort_and_oreder_pperations_widget.dart` - إضافة showcase للترتيب
- `lib/features/setting/presentation/widget/profile_user_widgets/profile_user_widget.dart` - إضافة زر البرنامج التعليمي
- `assets/translation/ar.json` - إضافة الترجمات العربية
- `assets/translation/en.json` - إضافة الترجمات الإنجليزية

## كيفية الاستخدام

### 1. بدء البرنامج التعليمي
```dart
// بدء البرنامج التعليمي الكامل
ShowcaseHelper.startShowcase(context);

// بدء showcase لعنصر محدد
ShowcaseHelper.startShowcaseForKey(context, key);
```

### 2. إضافة Showcase لعنصر جديد
```dart
Showcase(
  key: ShowcaseHelper.getShowcaseKey(ShowcaseKeys.homeSearch),
  title: 'عنوان الشرح',
  description: 'وصف الميزة',
  child: YourWidget(),
)
```

### 3. استخدام ShowcaseWrapper
```dart
ShowcaseWrapper(
  showcaseKey: ShowcaseKeys.homeSearch,
  child: YourWidget(),
)
```

## المفاتيح المتاحة (ShowcaseKeys)

```dart
class ShowcaseKeys {
  static const int homeSearch = 0;        // البحث في العمليات
  static const int homeFilterToggle = 1;  // تصفية العمليات
  static const int homeSortButton = 2;    // ترتيب العمليات
  static const int partnersAddButton = 3; // إضافة شريك جديد
  static const int operationsAddButton = 4; // إضافة عملية جديدة
  static const int notificationScreen = 5; // الإشعارات
  static const int settingsScreen = 6;    // الإعدادات
}
```

## البيانات المحددة مسبقاً

تم تعريف بيانات الشرح في `ShowcaseDataProvider`:

```dart
static const List<ShowcaseData> showcaseData = [
  ShowcaseData(
    title: 'البحث في العمليات',
    description: 'يمكنك البحث في جميع العمليات باستخدام هذا الحقل',
    icon: Icons.search,
    color: Colors.blue,
  ),
  // ... المزيد
];
```

## إضافة ميزة جديدة

### 1. إضافة مفتاح جديد
```dart
// في ShowcaseKeys
static const int newFeature = 7;

// في ShowcaseHelper.initializeShowcaseKeys()
_showcaseKeys.add(GlobalKey()); // إضافة مفتاح جديد
```

### 2. إضافة بيانات الشرح
```dart
// في ShowcaseDataProvider.showcaseData
ShowcaseData(
  title: 'الميزة الجديدة',
  description: 'وصف الميزة الجديدة',
  icon: Icons.new_feature,
  color: Colors.green,
),
```

### 3. تطبيق Showcase
```dart
Showcase(
  key: ShowcaseHelper.getShowcaseKey(ShowcaseKeys.newFeature),
  title: ShowcaseDataProvider.getData(ShowcaseKeys.newFeature).title,
  description: ShowcaseDataProvider.getData(ShowcaseKeys.newFeature).description,
  child: YourNewFeatureWidget(),
)
```

## التخصيص

### تخصيص مظهر Showcase
```dart
ShowCaseWidget(
  builder: (context) => YourApp(),
  onFinish: () {
    // عند انتهاء البرنامج التعليمي
  },
  onStart: (index, key) {
    // عند بدء showcase محدد
  },
)
```

### تخصيص الألوان والخطوط
```dart
Showcase(
  key: key,
  title: 'العنوان',
  description: 'الوصف',
  titleTextStyle: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
  ),
  descTextStyle: TextStyle(
    fontSize: 14,
    color: Colors.grey,
  ),
  child: YourWidget(),
)
```

## الميزات المتاحة

- ✅ برنامج تعليمي تفاعلي
- ✅ دعم متعدد اللغات (عربي/إنجليزي)
- ✅ إدارة مركزية للمفاتيح
- ✅ بيانات محددة مسبقاً
- ✅ مكونات قابلة لإعادة الاستخدام
- ✅ تكامل مع نظام التصميم الحالي

## ملاحظات مهمة

1. **تهيئة المفاتيح**: تأكد من استدعاء `ShowcaseHelper.initializeShowcaseKeys()` في `main.dart`
2. **ترتيب المفاتيح**: يجب أن يكون ترتيب المفاتيح في `ShowcaseKeys` مطابق لترتيبها في `initializeShowcaseKeys()`
3. **الترجمات**: أضف الترجمات الجديدة في ملفي `ar.json` و `en.json`
4. **الأداء**: لا تضيف showcase للعناصر التي تتغير بشكل متكرر

## استكشاف الأخطاء

### المشكلة: لا يظهر Showcase
**الحل**: تأكد من:
- تهيئة المفاتيح في `main.dart`
- استخدام المفتاح الصحيح
- وجود `ShowCaseWidget` في `my_app.dart`

### المشكلة: ترتيب خاطئ للـ Showcase
**الحل**: تأكد من تطابق ترتيب المفاتيح في `ShowcaseKeys` و `initializeShowcaseKeys()`

### المشكلة: لا تظهر الترجمات
**الحل**: تأكد من إضافة الترجمات في ملفي `ar.json` و `en.json`
