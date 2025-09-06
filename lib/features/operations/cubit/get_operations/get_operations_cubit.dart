import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_calcu/features/operations/data/operations_model.dart';
import 'package:x_calcu/features/operations/data/operations_repo.dart';

part 'get_operations_state.dart';
part 'get_operations_cubit.freezed.dart';

class GetOperationsCubit extends Cubit<GetOperationsState> {
  final OperationsRepo _operationsRepo;
  GetOperationsCubit(this._operationsRepo) : super(const GetOperationsState());

  Future<void> getOperations({
    String operationType = 'input',
    String orderBy = 'asc',
  }) async {
    emit(state.copyWith(isLoading: true, isError: false));

    final result = await _operationsRepo.getOperationsData(
      operationType: operationType,
      orderBy: orderBy,
    );

    result.when(
      success:
          (data) => emit(
            state.copyWith(isLoading: false, isError: false, operations: data),
          ),
      failure: (_) => emit(state.copyWith(isLoading: false, isError: true)),
    );
  }

  Future<void> getOperationDetails({required int operationId}) async {
    emit(state.copyWith(isLoading: true, isError: false));

    final result = await _operationsRepo.getOperationDetails(
      operationId: operationId,
    );

    result.when(
      success:
          (data) => emit(
            state.copyWith(isLoading: false, isError: false, operation: data),
          ),
      failure: (_) => emit(state.copyWith(isLoading: false, isError: true)),
    );
  }

  Future<void> getOperationsWithFilter({
    String? operationType,
    String? orderBy,
    String? search,
    int? page,
    int? limit,
  }) async {
    emit(state.copyWith(isLoading: true, isError: false));

    final result = await _operationsRepo.getOperationsDataWithFilter(
      operationType: operationType,
      orderBy: orderBy,
      search: search,
      page: page,
      limit: limit,
    );

    result.when(
      success:
          (data) => emit(
            state.copyWith(isLoading: false, isError: false, operations: data),
          ),
      failure: (_) => emit(state.copyWith(isLoading: false, isError: true)),
    );
  }

  void resetState() {
    emit(const GetOperationsState());
  }
}
