part of 'get_partner_cubit.dart';

@freezed
class GetPartnerState with _$GetPartnerState {
  const factory GetPartnerState({
    @Default([]) List<DropDownModel> fielData,
    @Default(false) bool isError,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
  }) = _GetPartnerState;
}
