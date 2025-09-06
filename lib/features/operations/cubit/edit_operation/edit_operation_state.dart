part of 'edit_operation_cubit.dart';

@freezed
class EditOperationState with _$EditOperationState {
  const factory EditOperationState({
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    @Default(false) bool isError,
    @Default(false) bool isOutputOperation,
    @Default('') String errorMessage,
    OperationModel? operation,
  }) = _EditOperationState;
}
