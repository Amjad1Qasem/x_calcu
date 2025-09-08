part of 'get_partner_drop_down_cubit.dart';

@freezed
class GetPartnerDropDownState with _$GetPartnerDropDownState {
  const factory GetPartnerDropDownState({
    @Default([]) List<DropDownModel> fielData,
    @Default(false) bool isError,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
  }) = _GetPartnerDropDownState;
}
