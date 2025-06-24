import 'package:freezed_annotation/freezed_annotation.dart';

part 'privacy_policy_model.freezed.dart';
part 'privacy_policy_model.g.dart';

@freezed
class PrivacyPolicyModel with _$PrivacyPolicyModel {
  factory PrivacyPolicyModel({String? key, List<String>? values}) =
      _PrivacyPolicyModel;

  factory PrivacyPolicyModel.fromJson(Map<String, dynamic> json) =>
      _$PrivacyPolicyModelFromJson(json);
}

List<PrivacyPolicyModel> getFakePolicyData() {
  return [
    PrivacyPolicyModel(
      key: 'المعلومات التي نجمعها',
      values: [
        'عند التسجيل أو استخدام خدماتنا، قد نجمع المعلومات التالية:',
        'الاسم الكامل.',
        'البريد الإلكتروني.',
        'رقم الهاتف.',
        'اسم المستخدم.',
        'صورة الملف الشخصي وصور الإعلانات.',
        'بيانات المتجر (مثل السجل التجاري للمستخدمين الموثقين).',
      ],
    ),
    PrivacyPolicyModel(
      key: 'كيفية استخدام المعلومات',
      values: [
        'نستخدم المعلومات التي نجمعها للأغراض التالية:',
        'تقديم وتحسين خدماتنا، بما في ذلك عرض الإعلانات.',
        'التحقق من الهوية والتوثيق.',
        'إدارة الحسابات والإعلانات.',
        'إرسال الإشعارات، التحديثات، والعروض الترويجية.',
        'معالجة المدفوعات وضمان أمانها.',
        'تحليل بيانات الاستخدام لتحسين المنصة وتجربة المستخدم.',
      ],
    ),
    PrivacyPolicyModel(
      key: 'مشاركة المعلومات',
      values: [
        'نلتزم بعدم بيع أو تأجير بياناتك الشخصية لأي أطراف خارجية.',
        'قد نشارك بياناتك فقط في الحالات التالية:',
        '1. للامتثال للقوانين: عند طلب السلطات القانونية أو إذا كان ذلك ضروريًا لحماية حقوقنا.',
        '2. مع المستخدمين الآخرين: في حالة البيانات التي توافق على مشاركتها، مثل معلومات الاتصال في الإعلانات.',
      ],
    ),
    PrivacyPolicyModel(
      key: 'حقوق المستخدم',
      values: [
        'لديك الحق في:',
        'الوصول إلى بياناتك الشخصية التي نحتفظ بها.',
        'طلب تعديل أو حذف بياناتك الشخصية.',
        'سحب موافقتك على معالجة بياناتك في أي وقت.',
      ],
    ),
    PrivacyPolicyModel(
      key: 'الاحتفاظ بالبيانات',
      values: [
        'نحتفظ ببياناتك طالما كان ذلك ضروريًا لتحقيق الأغراض الموضحة في هذه السياسة أو كما هو مطلوب بموجب القوانين المعمول بها.',
      ],
    ),
  ];
}
