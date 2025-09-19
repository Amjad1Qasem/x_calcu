import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_calcu/features/partners/data/models/partner_details_model.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';

part 'selection_state.dart';
part 'selection_cubit.freezed.dart';

class SelectionCubit extends Cubit<SelectionState> {
  SelectionCubit() : super(const SelectionState.initial());

  /// **Toggle selection mode on/off */
  void toggleSelectionMode() {
    state.when(
      initial: () => emit(const SelectionState.selectionMode()),
      selectionMode: () => emit(const SelectionState.initial()),
      selectionActive: (selectedItems) => emit(const SelectionState.initial()),
    );
  }

  /// **Enter selection mode */
  void enterSelectionMode() {
    emit(const SelectionState.selectionMode());
  }

  /// **Exit selection mode */
  void exitSelectionMode() {
    emit(const SelectionState.initial());
  }

  /// **Toggle item selection */
  void toggleItemSelection(PartnerDetailsOperation operation) {
    state.when(
      initial: () {
        // If not in selection mode, enter it first
        enterSelectionMode();
        emit(SelectionState.selectionActive(selectedItems: [operation]));
      },
      selectionMode: () {
        emit(SelectionState.selectionActive(selectedItems: [operation]));
      },
      selectionActive: (selectedItems) {
        final isSelected = selectedItems.any((item) => item.id == operation.id);
        List<PartnerDetailsOperation> newSelection;
        
        if (isSelected) {
          // Remove from selection
          newSelection = selectedItems.where((item) => item.id != operation.id).toList();
        } else {
          // Add to selection
          newSelection = [...selectedItems, operation];
        }
        
        if (newSelection.isEmpty) {
          emit(const SelectionState.selectionMode());
        } else {
          emit(SelectionState.selectionActive(selectedItems: newSelection));
        }
      },
    );
    
    printSuccess('Selection updated: ${state.maybeWhen(
      selectionActive: (items) => '${items.length} items selected',
      orElse: () => 'No items selected',
    )}');
  }

  /// **Select all items */
  void selectAll(List<PartnerDetailsOperation> allOperations) {
    emit(SelectionState.selectionActive(selectedItems: allOperations));
    printSuccess('All ${allOperations.length} items selected');
  }

  /// **Clear all selections */
  void clearSelection() {
    emit(const SelectionState.selectionMode());
    printSuccess('All selections cleared');
  }

  /// **Check if item is selected */
  bool isItemSelected(PartnerDetailsOperation operation) {
    return state.maybeWhen(
      selectionActive: (selectedItems) => 
        selectedItems.any((item) => item.id == operation.id),
      orElse: () => false,
    );
  }

  /// **Get selected items count */
  int get selectedItemsCount {
    return state.maybeWhen(
      selectionActive: (selectedItems) => selectedItems.length,
      orElse: () => 0,
    );
  }

  /// **Get selected items */
  List<PartnerDetailsOperation> get selectedItems {
    return state.maybeWhen(
      selectionActive: (selectedItems) => selectedItems,
      orElse: () => [],
    );
  }

  /// **Check if in selection mode */
  bool get isSelectionMode {
    return state.maybeWhen(
      selectionMode: () => true,
      selectionActive: (_) => true,
      orElse: () => false,
    );
  }
}
