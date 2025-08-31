part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  const factory HomeState.loading() = Loading;

  const factory HomeState.loaded({
    required List<OperationModel> operations,
    @Default(false) bool hasReachedMax,
    @Default(1) int currentPage,
  }) = Loaded;

  const factory HomeState.error({required String message}) = Error;

  const factory HomeState.filterChanged({required bool isInput}) =
      FilterChanged;

  const factory HomeState.loadingMore({
    required List<OperationModel> operations,
    @Default(1) int currentPage,
  }) = LoadingMore;

  const factory HomeState.searching({required String query}) = Searching;

  const factory HomeState.searchCleared() = SearchCleared;
}
