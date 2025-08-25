import 'package:flutter/material.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'statistic_partner_model.freezed.dart';
part 'statistic_partner_model.g.dart';



@freezed
class StatisticPartnerModel with _$StatisticPartnerModel {
  const factory StatisticPartnerModel({
    required String title,
    required String value,
  }) = _StatisticPartnerModel;

  factory StatisticPartnerModel.fromJson(Map<String, dynamic> json) =>
      _$StatisticPartnerModelFromJson(json);
}

class StatisticColorConfig {
  final Color backgroundColor;
  final Color borderColor;
  final Color fontColor;

  StatisticColorConfig({
    required this.backgroundColor,
    required this.borderColor,
    required this.fontColor,
  });
}

final List<StatisticColorConfig> colorConfigs = [
  StatisticColorConfig(
    backgroundColor: Color(0xfffef2f2),
    borderColor: Color(0xffFEE2E2),
    fontColor: Color(0xff992020),
  ),
  StatisticColorConfig(
    backgroundColor: Color(0xffFFF7EB),
    borderColor: Color(0xffFFE6BE),
    fontColor: Color(0xffff9900),
  ),
  StatisticColorConfig(
    backgroundColor: Color(0xffFAF5FF),
    borderColor: Color(0xffF3E8FF),
    fontColor: Color(0xff3D1263),
  ),
  StatisticColorConfig(
    backgroundColor: Color(0xffEFF6FF),
    borderColor: Color(0xffDBEAFE),
    fontColor: Color(0xff003569),
  ),
  StatisticColorConfig(
    backgroundColor: Color(0xffFFF4EC),
    borderColor: Color(0xffFFE4D3),
    fontColor: Color(0xffb45b20),
  ),
  StatisticColorConfig(
    backgroundColor: Color(0xffF9FAFB),
    borderColor: Color(0xffE3E3E3),
    fontColor: Color(0xff1e293b),
  ),
  StatisticColorConfig(
    backgroundColor: Color(0xffEBFFF4),
    borderColor: Color(0xffC2FFC9),
    fontColor: Color(0xff15803D),
  ),
];
