import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_account_model.freezed.dart';
part 'saved_account_model.g.dart';

@freezed
class SavedAccountModel with _$SavedAccountModel {
  const factory SavedAccountModel({
    required String id,
    required String username,
    required String password,
    required String displayName,
    required DateTime savedAt,
    @Default(false) bool isLastUsed,
  }) = _SavedAccountModel;

  factory SavedAccountModel.fromJson(Map<String, dynamic> json) =>
      _$SavedAccountModelFromJson(json);
}
