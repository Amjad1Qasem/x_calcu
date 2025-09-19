part of 'statistics_cubit.dart';

@freezed
class StatisticsState with _$StatisticsState {
  const factory StatisticsState.initial() = _Initial;

  const factory StatisticsState.loading() = Loading;

  const factory StatisticsState.loaded({
    required List<StatisticPartnerModel> data,
  }) = Loaded;

  const factory StatisticsState.error({required String message}) = Error;
}
