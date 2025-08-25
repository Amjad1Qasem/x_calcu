import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_calcu/features/operations/data/operations_model.dart';
import 'package:x_calcu/features/operations/data/operations_repo.dart';

part 'get_partner_state.dart';
part 'get_partner_cubit.freezed.dart';

class GetPartnerCubit extends Cubit<GetPartnerState> {
  final OperationsRepo _operationsRepo;

  GetPartnerCubit(this._operationsRepo) : super(const GetPartnerState());

  Future<void> getOperationsDropdown() async {
    emit(state.copyWith(isLoading: true, isError: false));
    final response = await _operationsRepo.getCvFieldssData();

    response.when(
      success: (data) {
        emit(state.copyWith(
          isLoading: false,
          isError: false,
          fielData: data,
        ));
      },
      failure: (_) => emit(state.copyWith(isLoading: false, isError: true)),
    );
  }
}
