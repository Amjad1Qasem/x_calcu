part of 'selection_cubit.dart';

@freezed
class SelectionState with _$SelectionState {
  const factory SelectionState.initial() = _Initial;
  const factory SelectionState.selectionMode() = _SelectionMode;
  const factory SelectionState.selectionActive({
    required List<PartnerDetailsOperation> selectedItems,
  }) = _SelectionActive;
}
