part of 'partner_cubit.dart';

@freezed
class PartnerState with _$PartnerState {
  const factory PartnerState.initial() = _Initial;
  const factory PartnerState.loading() = Loading;
  const factory PartnerState.loaded({
    required List<StatisticPartnerModel> data,
  }) = Loaded;
  const factory PartnerState.error({required String message}) = Error;
  //Get Partner Details
  const factory PartnerState.partnerloading() = PartnerLoading;
  const factory PartnerState.partnerloaded({required PartnerModel data}) =
      PartnerLoaded;
  const factory PartnerState.partnererror({required String message}) =
      PartnerError;
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
