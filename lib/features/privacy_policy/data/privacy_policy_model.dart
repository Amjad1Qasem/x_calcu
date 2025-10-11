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
        'عند التسجيل أو استخدام تطبيق XCalcu، قد نجمع المعلومات التالية:',
        'بيانات الاتصال (البريد الإلكتروني، رقم الهاتف).',
        'بيانات المصادقة الحيوية (بصمة الإصبع، التعرف على الوجه) للوصول الآمن.',
        'معلومات العمليات المالية (الفواتير، المبالغ، التواريخ، الشركاء).',
        'بيانات الشركاء والعملاء (الأسماء، أرقام الهواتف، البريد الإلكتروني).',
        'بيانات الإشعارات والتذكيرات المالية.',
        'معلومات الجهاز (نوع الجهاز، نظام التشغيل، معرف الجهاز).',
      ],
      valuesEn: [
        'When registering or using the XCalcu app, we may collect the following information:',
        'Contact information (email, phone number).',
        'Biometric authentication data (fingerprint, face recognition) for secure access.',
        'Financial transaction information (invoices, amounts, dates, partners).',
        'Partner and customer data (names, phone numbers, email addresses).',
        'Notification and financial reminder data.',
        'Device information (device type, operating system, device identifier).',
      ],
    ),
    PrivacyPolicyModel(
      key: 'كيفية استخدام المعلومات',
      keyEn: 'How We Use Information',
      values: [
        'نستخدم المعلومات التي نجمعها للأغراض التالية:',
        'تقديم خدمات الوساطة العقارية والتجارية وإدارة العمليات المالية.',
        'التحقق من الهوية باستخدام المصادقة الحيوية لضمان الأمان.',
        'إدارة الشركاء والعملاء وتوثيق العمليات.',
        'إرسال تذكيرات بالدفعات المستحقة والإشعارات المهمة.',
        'توليد التقارير المالية وملفات PDF للعمليات.',
        'حفظ وتوثيق العمليات مع المرفقات لضمان الشفافية.',
        'تحسين تجربة المستخدم وتطوير الميزات الجديدة.',
        'ضمان أمان البيانات وحماية المعلومات الحساسة.',
      ],
      valuesEn: [
        'We use the information we collect for the following purposes:',
        'Providing real estate and commercial brokerage services and managing financial transactions.',
        'Identity verification using biometric authentication to ensure security.',
        'Managing partners and customers and documenting transactions.',
        'Sending payment due reminders and important notifications.',
        'Generating financial reports and PDF files for transactions.',
        'Saving and documenting transactions with attachments to ensure transparency.',
        'Improving user experience and developing new features.',
        'Ensuring data security and protecting sensitive information.',
      ],
    ),
    PrivacyPolicyModel(
      key: 'مشاركة المعلومات',
      keyEn: 'Information Sharing',
      values: [
        'نلتزم بعدم بيع أو تأجير بياناتك الشخصية لأي أطراف خارجية.',
        'قد نشارك بياناتك فقط في الحالات التالية:',
        '1. للامتثال للقوانين: عند طلب السلطات القانونية أو إذا كان ذلك ضروريًا لحماية حقوقنا.',
        '2. مع الشركاء المعتمدين: في حالة العمليات المشتركة التي تتطلب مشاركة البيانات.',
        '3. مع مقدمي الخدمات: للشركات التي تساعدنا في تشغيل التطبيق (مثل خدمات التخزين السحابي).',
        '4. في حالة الطوارئ: لحماية الأرواح أو الممتلكات أو منع الاحتيال.',
        '5. مع موافقتك الصريحة: عند مشاركة تقارير العمليات مع الأطراف المعنية.',
      ],
      valuesEn: [
        'We are committed to not selling or renting your personal data to any third parties.',
        'We may share your data only in the following cases:',
        '1. To comply with laws: when requested by legal authorities or if necessary to protect our rights.',
        '2. With authorized partners: in case of joint transactions that require data sharing.',
        '3. With service providers: companies that help us operate the app (such as cloud storage services).',
        '4. In emergency situations: to protect lives or property or prevent fraud.',
        '5. With your explicit consent: when sharing transaction reports with concerned parties.',
      ],
    ),
    PrivacyPolicyModel(
      key: 'أمان البيانات',
      keyEn: 'Data Security',
      values: [
        'نطبق أعلى معايير الأمان لحماية بياناتك:',
        'تشفير البيانات الحساسة باستخدام تقنيات التشفير المتقدمة.',
        'المصادقة الحيوية للوصول الآمن إلى التطبيق.',
        'حفظ البيانات على خوادم آمنة مع حماية متعددة الطبقات.',
        'مراقبة مستمرة للأنشطة المشبوهة والوصول غير المصرح به.',
        'نسخ احتياطية منتظمة للبيانات مع تشفير النسخ الاحتياطية.',
        'تدريب فريق العمل على أفضل ممارسات أمان البيانات.',
      ],
      valuesEn: [
        'We apply the highest security standards to protect your data:',
        'Encryption of sensitive data using advanced encryption technologies.',
        'Biometric authentication for secure app access.',
        'Data storage on secure servers with multi-layer protection.',
        'Continuous monitoring of suspicious activities and unauthorized access.',
        'Regular data backups with encrypted backup copies.',
        'Staff training on best data security practices.',
      ],
    ),
    PrivacyPolicyModel(
      key: 'حقوق المستخدم',
      keyEn: 'User Rights',
      values: [
        'لديك الحق في:',
        'الوصول إلى العمليات المحفوظة في التطبيق.',
        'طلب تعديل أو حذف بيانات حسابك.',
        'تصدير بياناتك في صيغة قابلة للقراءة (PDF).',
        'إلغاء الاشتراك في الإشعارات أو أنواع معينة من التواصل.',
      ],
      valuesEn: [
        'You have the right to:',
        'Access transactions saved in the app.',
        'Request modification or deletion of your account data.',
        'Export your data in a readable format (PDF).',
        'Unsubscribe from notifications or specific types of communication.',
      ],
    ),
    PrivacyPolicyModel(
      key: 'الاحتفاظ بالبيانات',
      keyEn: 'Data Retention',
      values: [
        'بيانات المصادقة الحيوية: محفوظة محلياً على الجهاز فقط، لا يتم إرسالها لخوادمنا.',
        'بيانات الإشعارات: محفوظة محلياً على الجهاز فقط، وأي إزالة أو حذف لبيانات التطبيق أو للتطبيق نفسه تؤدي إلى حذف كل الإشعارات.',
      ],
      valuesEn: [
        'Biometric authentication data: stored locally on device only, not sent to our servers.',
        'Notification data: stored locally on device only, and any removal or deletion of app data or the app itself will result in deletion of all notifications.',
      ],
    ),
    PrivacyPolicyModel(
      key: 'تحديث السياسة',
      keyEn: 'Policy Updates',
      values: [
        'قد نقوم بتحديث هذه السياسة من وقت لآخر.',
        'سيتم إشعارك بأي تغييرات مهمة عبر التطبيق أو البريد الإلكتروني.',
        'استمرار استخدام التطبيق بعد التحديثات يعني موافقتك على السياسة الجديدة.',
        'ننصح بمراجعة هذه السياسة بانتظام للاطلاع على أي تغييرات.',
        'تاريخ آخر تحديث: ديسمبر 2025.',
      ],
      valuesEn: [
        'We may update this policy from time to time.',
        'You will be notified of any significant changes through the app or email.',
        'Continued use of the app after updates means you agree to the new policy.',
        'We recommend reviewing this policy regularly to stay informed of any changes.',
        'Last updated: December 2025.',
      ],
    ),
  ];
}
