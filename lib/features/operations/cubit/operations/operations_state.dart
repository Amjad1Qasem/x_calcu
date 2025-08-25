part of 'operations_cubit.dart';

@freezed
class OperationsState with _$OperationsState {
  const factory OperationsState({
    @Default(false) bool? isLoading,
    @Default(false) bool? isSuccess,
    @Default(false) bool? isError,
    @Default(false) bool? isOutputOperation,
    OperationModel? operation,
  }) = _OperationsState;
}
