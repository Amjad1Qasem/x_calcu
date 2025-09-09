import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_calcu/features/partners/data/repo/partner_repo.dart';
import 'package:x_calcu/global/networking/failure.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';

part 'delete_partner_state.dart';
part 'delete_partner_cubit.freezed.dart';

class DeletePartnerCubit extends Cubit<DeletePartnerState> {
  final PartnerRepo _partnerRepo;

  DeletePartnerCubit(this._partnerRepo)
    : super(const DeletePartnerState.initial());

  /// Delete a partner by ID
  Future<void> deletePartner({required int id}) async {
    emit(const DeletePartnerState.loading());

    final response = await _partnerRepo.deletePartner(id: id);

    response.when(
      success: (data) {
        printSuccess('Partner deleted successfully with ID: $id');
        emit(const DeletePartnerState.success());
      },
      failure: (error) {
        printError('Failed to delete partner with ID $id: $error');
        emit(
          DeletePartnerState.error(
            message:
                error is ValidationInputError
                    ? error.message
                    : 'Failed to delete partner',
          ),
        );
      },
    );
  }

  /// Reset state to initial
  void resetState() {
    emit(const DeletePartnerState.initial());
  }
}
