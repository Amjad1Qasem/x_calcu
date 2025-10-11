import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_calcu/features/operations/data/operations_repo.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';

part 'delete_operation_state.dart';
part 'delete_operation_cubit.freezed.dart';

class DeleteOperationCubit extends Cubit<DeleteOperationState> {
  final OperationsRepo _operationsRepo;
  DeleteOperationCubit(this._operationsRepo)
    : super(DeleteOperationState.initial());
  Future<void> deleteOperation({required int operationId}) async {
    emit(const DeleteOperationState.loading());

    final result = await _operationsRepo.deleteOperation(
      operationId: operationId,
    );

    result.when(
      success: (data) {
        printSuccess('Operation deleted successfully');
        emit(const DeleteOperationState.success());
      },
      failure:(error) => emit(
            DeleteOperationState.error(message: error.message),
          ),
    );
  }
}
