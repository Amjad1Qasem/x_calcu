part of 'delete_operation_cubit.dart';

@freezed
class DeleteOperationState with _$DeleteOperationState {
  const factory DeleteOperationState.initial() = _Initial;
  const factory DeleteOperationState.loading() = Loading;

  const factory DeleteOperationState.success() = Success;

  const factory DeleteOperationState.error({required String message}) = Error;
}
