part of 'create_operation_cubit.dart';

@freezed
class CreateOperationState with _$CreateOperationState {
  const factory CreateOperationState({
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    @Default(false) bool isError,
    @Default(false) bool isOutputOperation,
    @Default('') String errorMessage,
  }) = _CreateOperationState;
}
