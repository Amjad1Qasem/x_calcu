import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_calcu/features/partners/data/models/partner_details_model.dart';
import 'package:x_calcu/features/partners/data/repo/partner_repo.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';

part 'partner_details_state.dart';
part 'partner_details_cubit.freezed.dart';

class PartnerDetailsCubit extends Cubit<PartnerDetailsState> {
  final PartnerRepo _partnerRepo;
  PartnerDetailsCubit(this._partnerRepo) : super(PartnerDetailsState.initial());

  // Filter variables
  bool isInput = true;
  String _currentOperationType = 'input';
  int? _currentPartnerId;

  // Getters
  String get currentOperationType => _currentOperationType;

  /// **Filter Result by Input or Output**
  void operationFilter() {
    isInput = !isInput;
    _currentOperationType = isInput ? 'input' : 'output';
    emit(PartnerDetailsState.loading());
    printSuccess('Filter changed to: $_currentOperationType');

    // Refresh data with new filter if we have a partner ID
    if (_currentPartnerId != null) {
      getPartnerDetails(partnerId: _currentPartnerId!);
    }
  }

  /// **Get Partner Details with Operations */
  Future<void> getPartnerDetails({
    required int partnerId,
    bool refresh = false,
  }) async {
    _currentPartnerId = partnerId;

    if (refresh) {
      emit(PartnerDetailsState.loading());
    } else if (state is! Loading) {
      emit(PartnerDetailsState.loading());
    }

    printSuccess(
      '📡 API Call - Partner ID: $partnerId, Operation Type: $_currentOperationType',
    );

    final result = await _partnerRepo.getPartnerDetailsWithOperations(
      id: partnerId,
      operationType: _currentOperationType,
    );

    result.when(
      success: (data) {
        printSuccess('✅ Partner details loaded successfully');
        emit(PartnerDetailsState.loaded(data: data));
      },
      failure: (failure) {
        printError('❌ Failed to load partner details: ${failure.message}');
        emit(PartnerDetailsState.error(message: failure.message));
      },
    );
  }

  /// **Refresh Partner Details */
  Future<void> refreshPartnerDetails({required int partnerId}) async {
    await getPartnerDetails(partnerId: partnerId, refresh: true);
  }
}
