import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_calcu/features/operations/data/operations_model.dart';
import 'package:x_calcu/features/operations/data/operations_repo.dart';

part 'get_partner_drop_down_state.dart';
part 'get_partner_drop_down_cubit.freezed.dart';

class GetPartnerDropDownCubit extends Cubit<GetPartnerDropDownState> {
  final OperationsRepo _operationsRepo;

  GetPartnerDropDownCubit(this._operationsRepo)
    : super(const GetPartnerDropDownState());

  Future<void> getPartnersDropdown() async {
    emit(state.copyWith(isLoading: true, isError: false));
    final response = await _operationsRepo.getPartnersDropdown();

    response.when(
      success: (data) {
        emit(state.copyWith(isLoading: false, isError: false, fielData: data));
      },
      failure: (_) => emit(state.copyWith(isLoading: false, isError: true)),
    );
  }
}
