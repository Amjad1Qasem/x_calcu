part of 'get_operations_cubit.dart';

@freezed
class GetOperationsState with _$GetOperationsState {
  const factory GetOperationsState({
    @Default(false) bool isLoading,
    @Default(false) bool isError,
    @Default([]) List<OperationModel> operations,
    OperationModel? operation,
  }) = _GetOperationsState;
}
