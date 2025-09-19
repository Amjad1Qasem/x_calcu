part of 'partner_cubit.dart';

@freezed
class PartnerState with _$PartnerState {
  const factory PartnerState.initial() = _Initial;

  //Get Partners
  const factory PartnerState.partnersloading() = PartnersLoading;
  const factory PartnerState.partnersloaded({
    required List<PartnerModel> data,
    @Default(false) bool hasReachedMax,
    @Default(1) int currentPage,
  }) = PartnersLoaded;
  const factory PartnerState.partnerserror({required String message}) =
      PartnersError;
}
