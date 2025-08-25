import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_calcu/features/partners/data/models/partner_model.dart';
import 'package:x_calcu/features/partners/data/repo/partner_repo.dart';
import 'package:x_calcu/features/partners/data/models/statistic_partner_model.dart';

part 'partner_state.dart';
part 'partner_cubit.freezed.dart';

class PartnerCubit extends Cubit<PartnerState> {
  final PartnerRepo _partnerRepo;
  PartnerCubit(this._partnerRepo) : super(PartnerState.initial());
  // get Partner Details Scree
  Future<void> getPartnerDetails({required int id}) async {
    emit(PartnerState.partnersloading());
    final response = await _partnerRepo.getPartnersData();

    response.when(
      success: (data) {
        emit(PartnerState.partnersloaded(data: data));
      },
      failure:
          (_) => emit(
            const PartnerState.partnerserror(message: "Failed to get Partner"),
          ),
    );
  }

  // get Partner Details Scree
  Future<void> getPartner({required int id}) async {
    emit(PartnerState.partnerloading());
    final response = await _partnerRepo.getPartnerDetailsData(id: id);

    response.when(
      success: (data) {
        emit(PartnerState.partnerloaded(data: data));
      },
      failure:
          (_) => emit(
            const PartnerState.partnererror(message: "Failed to get Partner"),
          ),
    );
  }

  // In Partners Screen
  Future<void> getStatistics() async {
    emit(PartnerState.loading());
    await Future.delayed(const Duration(seconds: 2));
    try {
      final data = List.generate(
        7,
        (index) => StatisticPartnerModel(
          title: "Title $index",
          value: "${100 + index}",
        ),
      );
      emit(PartnerState.loaded(data: data));
    } catch (e) {
      emit(const PartnerState.error(message: "Failed to load data"));
    }
  }
}
