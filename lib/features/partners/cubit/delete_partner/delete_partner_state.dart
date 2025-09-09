part of 'delete_partner_cubit.dart';

@freezed
class DeletePartnerState with _$DeletePartnerState {
  const factory DeletePartnerState.initial() = _Initial;
  const factory DeletePartnerState.loading() = _Loading;
  const factory DeletePartnerState.success() = _Success;
  const factory DeletePartnerState.error({required String message}) = _Error;
}
