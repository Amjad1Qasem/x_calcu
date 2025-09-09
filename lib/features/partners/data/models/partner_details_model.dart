class PartnerDetailsModel {
  final PartnerDetailsData data;

  const PartnerDetailsModel({required this.data});

  factory PartnerDetailsModel.fromJson(Map<String, dynamic> json) {
    return PartnerDetailsModel(data: PartnerDetailsData.fromJson(json['data']));
  }
}

class PartnerDetailsData {
  final PartnerDetailsPartner partner;
  final PartnerDetailsStatistic statistic;
  final List<PartnerDetailsOperation> operations;

  const PartnerDetailsData({
    required this.partner,
    required this.statistic,
    required this.operations,
  });

  factory PartnerDetailsData.fromJson(Map<String, dynamic> json) {
    return PartnerDetailsData(
      partner: PartnerDetailsPartner.fromJson(json['partner']),
      statistic: PartnerDetailsStatistic.fromJson(json['statistic']),
      operations:
          (json['operations'] as List)
              .map((e) => PartnerDetailsOperation.fromJson(e))
              .toList(),
    );
  }
}

class PartnerDetailsPartner {
  final int id;
  final String name;
  final String email;
  final String phone;
  final double totalPercentageValue;
  final String createdAt;
  final String updatedAt;

  const PartnerDetailsPartner({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.totalPercentageValue,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PartnerDetailsPartner.fromJson(Map<String, dynamic> json) {
    return PartnerDetailsPartner(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      totalPercentageValue: (json['total_percentage_value'] ?? 0.0).toDouble(),
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class PartnerDetailsStatistic {
  final double totalInvoiceValues;
  final double totalInvoicePayments;
  final double remainingInvoices;
  final double dueAmount;
  final double receivedAmount;
  final double remainingAmount;
  final double profits;

  const PartnerDetailsStatistic({
    required this.totalInvoiceValues,
    required this.totalInvoicePayments,
    required this.remainingInvoices,
    required this.dueAmount,
    required this.receivedAmount,
    required this.remainingAmount,
    required this.profits,
  });

  factory PartnerDetailsStatistic.fromJson(Map<String, dynamic> json) {
    return PartnerDetailsStatistic(
      totalInvoiceValues: (json['مجاميع قيم الفواتير'] ?? 0.0).toDouble(),
      totalInvoicePayments: (json['مجاميع سداد الفواتير'] ?? 0.0).toDouble(),
      remainingInvoices: (json['باقي الفواتير'] ?? 0.0).toDouble(),
      dueAmount: (json['المبلغ المستحقة'] ?? 0.0).toDouble(),
      receivedAmount: (json['المبلغ المقبوضة'] ?? 0.0).toDouble(),
      remainingAmount: (json['المبلغ المتبقية'] ?? 0.0).toDouble(),
      profits: (json['الارباح'] ?? 0.0).toDouble(),
    );
  }
}

class PartnerDetailsOperation {
  final int id;
  final String partnerName;
  final String clientName;
  final String operationType;
  final String invoiceNumber;
  final double invoiceValue;
  final PartnerDetailsPayment invoicePayment;
  final double remainingFromInvoice;
  final PartnerDetailsPercentage myPercentage;
  final double dueAmount;
  final PartnerDetailsPayment receivedAmount;
  final double remainingAmount;
  final String date;
  final String notificationDate;
  final String? notes;

  const PartnerDetailsOperation({
    required this.id,
    required this.partnerName,
    required this.clientName,
    required this.operationType,
    required this.invoiceNumber,
    required this.invoiceValue,
    required this.invoicePayment,
    required this.remainingFromInvoice,
    required this.myPercentage,
    required this.dueAmount,
    required this.receivedAmount,
    required this.remainingAmount,
    required this.date,
    required this.notificationDate,
    this.notes,
  });

  factory PartnerDetailsOperation.fromJson(Map<String, dynamic> json) {
    return PartnerDetailsOperation(
      id: json['id'],
      partnerName: json['اسم الشريك'],
      clientName: json['اسم العميل'],
      operationType: json['نوع العملية'],
      invoiceNumber: json['رقم الفاتورة'],
      invoiceValue: (json['قيمة الفاتورة'] ?? 0.0).toDouble(),
      invoicePayment: PartnerDetailsPayment.fromJson(json['سدد من الفاتورة']),
      remainingFromInvoice: (json['باقي من الفاتورة'] ?? 0.0).toDouble(),
      myPercentage: PartnerDetailsPercentage.fromJson(json['نسبتي من المبلغ']),
      dueAmount: (json['المبلغ المستحق'] ?? 0.0).toDouble(),
      receivedAmount: PartnerDetailsPayment.fromJson(json['المبلغ المقبوض']),
      remainingAmount: (json['المبلغ المتبقي'] ?? 0.0).toDouble(),
      date: json['التاريخ'],
      notificationDate: json['تاريخ التنبيه'],
      notes: json['الملاحظات'],
    );
  }
}

class PartnerDetailsPayment {
  final double totalValue;
  final List<PartnerDetailsPaymentDetail> details;

  const PartnerDetailsPayment({
    required this.totalValue,
    required this.details,
  });

  factory PartnerDetailsPayment.fromJson(Map<String, dynamic> json) {
    return PartnerDetailsPayment(
      totalValue: (json['قيمة السداد الكلية'] ?? 0.0).toDouble(),
      details:
          (json['القيم التفصيلية'] as List)
              .map((e) => PartnerDetailsPaymentDetail.fromJson(e))
              .toList(),
    );
  }
}

class PartnerDetailsPaymentDetail {
  final double invoiceValue;
  final String invoiceDate;

  const PartnerDetailsPaymentDetail({
    required this.invoiceValue,
    required this.invoiceDate,
  });

  factory PartnerDetailsPaymentDetail.fromJson(Map<String, dynamic> json) {
    return PartnerDetailsPaymentDetail(
      invoiceValue: (json['invoice_value'] ?? 0.0).toDouble(),
      invoiceDate: json['invoice_date'],
    );
  }
}

class PartnerDetailsPercentage {
  final String percentage;
  final double percentageValue;

  const PartnerDetailsPercentage({
    required this.percentage,
    required this.percentageValue,
  });

  factory PartnerDetailsPercentage.fromJson(Map<String, dynamic> json) {
    return PartnerDetailsPercentage(
      percentage: json['النسبة المئوية'],
      percentageValue: (json['قيمة النسبة المئوية'] ?? 0.0).toDouble(),
    );
  }
}
