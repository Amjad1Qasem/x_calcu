part of 'edit_partner_cubit.dart';

@freezed
class EditPartnerState with _$EditPartnerState {
  const factory EditPartnerState({
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    @Default(false) bool isError,
    @Default('') String errorMessage,
    PartnerModel? data,
    PartnerModel? partner,
  }) = _EditPartnerState;
}
