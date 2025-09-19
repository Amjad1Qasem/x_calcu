class PrivacyPolicyModel {
  final String? key;
  final String? keyEn;
  final List<String>? values;
  final List<String>? valuesEn;

  const PrivacyPolicyModel({this.key, this.keyEn, this.values, this.valuesEn});

  factory PrivacyPolicyModel.fromJson(Map<String, dynamic> json) {
    return PrivacyPolicyModel(
      key: json['key'] as String?,
      keyEn: json['keyEn'] as String?,
      values: (json['values'] as List<dynamic>?)?.cast<String>(),
      valuesEn: (json['valuesEn'] as List<dynamic>?)?.cast<String>(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'key': key, 'keyEn': keyEn, 'values': values, 'valuesEn': valuesEn};
  }
}

List<PrivacyPolicyModel> getFakePolicyData() {
  return [
    PrivacyPolicyModel(
      key: 'المعلومات التي نجمعها',
      keyEn: 'Information We Collect',
      values: [
        'عند التسجيل أو استخدام خدماتنا، قد نجمع المعلومات التالية:',
        'الاسم الكامل.',
        'البريد الإلكتروني.',
        'رقم الهاتف.',
        'اسم المستخدم.',
        'صورة الملف الشخصي وصور الإعلانات.',
        'بيانات المتجر (مثل السجل التجاري للمستخدمين الموثقين).',
      ],
      valuesEn: [
        'When registering or using our services, we may collect the following information:',
        'Full name.',
        'Email address.',
        'Phone number.',
        'Username.',
        'Profile picture and advertisement images.',
        'Store data (such as commercial registry for verified users).',
      ],
    ),
    PrivacyPolicyModel(
      key: 'كيفية استخدام المعلومات',
      keyEn: 'How We Use Information',
      values: [
        'نستخدم المعلومات التي نجمعها للأغراض التالية:',
        'تقديم وتحسين خدماتنا، بما في ذلك عرض الإعلانات.',
        'التحقق من الهوية والتوثيق.',
        'إدارة الحسابات والإعلانات.',
        'إرسال الإشعارات، التحديثات، والعروض الترويجية.',
        'معالجة المدفوعات وضمان أمانها.',
        'تحليل بيانات الاستخدام لتحسين المنصة وتجربة المستخدم.',
      ],
      valuesEn: [
        'We use the information we collect for the following purposes:',
        'Providing and improving our services, including displaying advertisements.',
        'Identity verification and authentication.',
        'Managing accounts and advertisements.',
        'Sending notifications, updates, and promotional offers.',
        'Processing payments and ensuring their security.',
        'Analyzing usage data to improve the platform and user experience.',
      ],
    ),
    PrivacyPolicyModel(
      key: 'مشاركة المعلومات',
      keyEn: 'Information Sharing',
      values: [
        'نلتزم بعدم بيع أو تأجير بياناتك الشخصية لأي أطراف خارجية.',
        'قد نشارك بياناتك فقط في الحالات التالية:',
        '1. للامتثال للقوانين: عند طلب السلطات القانونية أو إذا كان ذلك ضروريًا لحماية حقوقنا.',
        '2. مع المستخدمين الآخرين: في حالة البيانات التي توافق على مشاركتها، مثل معلومات الاتصال في الإعلانات.',
      ],
      valuesEn: [
        'We are committed to not selling or renting your personal data to any third parties.',
        'We may share your data only in the following cases:',
        '1. To comply with laws: when requested by legal authorities or if necessary to protect our rights.',
        '2. With other users: in case of data you agree to share, such as contact information in advertisements.',
      ],
    ),
    PrivacyPolicyModel(
      key: 'حقوق المستخدم',
      keyEn: 'User Rights',
      values: [
        'لديك الحق في:',
        'الوصول إلى بياناتك الشخصية التي نحتفظ بها.',
        'طلب تعديل أو حذف بياناتك الشخصية.',
        'سحب موافقتك على معالجة بياناتك في أي وقت.',
      ],
      valuesEn: [
        'You have the right to:',
        'Access your personal data that we hold.',
        'Request modification or deletion of your personal data.',
        'Withdraw your consent to process your data at any time.',
      ],
    ),
    PrivacyPolicyModel(
      key: 'الاحتفاظ بالبيانات',
      keyEn: 'Data Retention',
      values: [
        'نحتفظ ببياناتك طالما كان ذلك ضروريًا لتحقيق الأغراض الموضحة في هذه السياسة أو كما هو مطلوب بموجب القوانين المعمول بها.',
      ],
      valuesEn: [
        'We retain your data as long as necessary to achieve the purposes outlined in this policy or as required by applicable laws.',
      ],
    ),
  ];
}
