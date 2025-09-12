import 'partner_details_model.dart';

class PartnerOperationsModel {
  final List<PartnerDetailsOperation> data;
  final PartnerOperationsLinks? links;

  const PartnerOperationsModel({required this.data, this.links});

  factory PartnerOperationsModel.fromJson(Map<String, dynamic> json) {
    return PartnerOperationsModel(
      data:
          (json['data'] as List)
              .map((e) => PartnerDetailsOperation.fromJson(e))
              .toList(),
      links:
          json['links'] != null
              ? PartnerOperationsLinks.fromJson(json['links'])
              : null,
    );
  }
}

class PartnerOperationsLinks {
  final String first;
  final String last;
  final String? prev;
  final String? next;

  const PartnerOperationsLinks({
    required this.first,
    required this.last,
    this.prev,
    this.next,
  });

  factory PartnerOperationsLinks.fromJson(Map<String, dynamic> json) {
    return PartnerOperationsLinks(
      first: json['first'],
      last: json['last'],
      prev: json['prev'],
      next: json['next'],
    );
  }

  bool get hasNext => next != null;
  bool get hasPrev => prev != null;
}
