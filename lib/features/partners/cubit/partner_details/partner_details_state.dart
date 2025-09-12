part of 'partner_details_cubit.dart';

@freezed
class PartnerDetailsState with _$PartnerDetailsState {
  const factory PartnerDetailsState.initial() = _Initial;
  const factory PartnerDetailsState.loading() = Loading;
  const factory PartnerDetailsState.loaded({
    required PartnerDetailsData data,
    required PartnerOperationsModel operations,
  }) = Loaded;
  const factory PartnerDetailsState.error({required String message}) = Error;
}
