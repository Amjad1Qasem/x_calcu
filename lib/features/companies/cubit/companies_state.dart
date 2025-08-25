part of 'companies_cubit.dart';

@freezed
class CompaniesState with _$CompaniesState {
  const factory CompaniesState({
    @Default(false) bool? isLoading,
    @Default(false) bool? isSuccess,
    @Default(false) bool? isError,
    CompaniesModel? data,
  }) = _CompaniesState;
}
