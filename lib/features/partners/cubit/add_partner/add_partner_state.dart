part of 'add_partner_cubit.dart';

@freezed
class AddPartnerState with _$AddPartnerState {
  const factory AddPartnerState({
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    @Default(false) bool isError,
    PartnerModel? data,
  }) = _AddPartnerState;
}
