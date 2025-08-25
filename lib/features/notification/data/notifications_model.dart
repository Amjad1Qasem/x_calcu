import 'package:freezed_annotation/freezed_annotation.dart';

part 'notifications_model.freezed.dart';
part 'notifications_model.g.dart';

@freezed
class NotificationsModel with _$NotificationsModel {
  const factory NotificationsModel({
    String? title,
    String? message,
    String? date,
    bool? isRead,
    required NotificationsType type,
  }) = _NotificationsModel;

  factory NotificationsModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationsModelFromJson(
        json["data"] is Map<String, dynamic> ? json["data"] : json,
      );
}

enum NotificationsType { input, outPut }

final List<NotificationsModel> fakeNotifications = [
  NotificationsModel(
    title: 'Incoming Transaction',
    message:
        'You have a payment on 01/01/2025 to Al-Haram Money Transfer Company.',
    date: '01/01/2025 - 10:06 PM',
    isRead: false,
    type: NotificationsType.outPut,
  ),
  NotificationsModel(
    title: 'Outgoing Transaction',
    message:
        'You received a payment on 01/01/2025 from Al-Haram Money Transfer Company.',
    date: '01/01/2025 - 10:06 PM',
    isRead: true,
    type: NotificationsType.input,
  ),
  NotificationsModel(
    title: 'Bill Payment',
    message:
        '50,000 SYP has been deducted from your wallet for internet services.',
    date: '05/01/2025 - 01:20 PM',
    isRead: false,
    type: NotificationsType.outPut,
  ),
  NotificationsModel(
    title: 'Payment Received',
    message: '100,000 SYP has been transferred from MTN to your wallet.',
    date: '07/01/2025 - 09:45 AM',
    isRead: true,
    type: NotificationsType.input,
  ),
  NotificationsModel(
    title: 'Transfer Sent',
    message: 'You sent 25,000 SYP to Ahmad Youssef.',
    date: '08/01/2025 - 04:30 PM',
    isRead: false,
    type: NotificationsType.outPut,
  ),
  NotificationsModel(
    title: 'Money Transfer',
    message: 'You received 60,000 SYP from Samer Khaled.',
    date: '09/01/2025 - 11:12 AM',
    isRead: true,
    type: NotificationsType.input,
  ),
  NotificationsModel(
    title: 'Electricity Bill',
    message: 'You paid 45,000 SYP for your electricity bill.',
    date: '10/01/2025 - 07:00 PM',
    isRead: false,
    type: NotificationsType.outPut,
  ),
  NotificationsModel(
    title: 'Funds Added',
    message: '200,000 SYP has been added to your account from Gulf Transfers.',
    date: '11/01/2025 - 03:15 PM',
    isRead: false,
    type: NotificationsType.input,
  ),
  NotificationsModel(
    title: 'Cash Withdrawal',
    message: 'You withdrew 70,000 SYP from the main branch.',
    date: '12/01/2025 - 08:55 AM',
    isRead: true,
    type: NotificationsType.outPut,
  ),
  NotificationsModel(
    title: 'Instant Transfer Received',
    message: 'You received 90,000 SYP from Fadi Issa via instant transfer.',
    date: '13/01/2025 - 12:30 PM',
    isRead: false,
    type: NotificationsType.input,
  ),
];
