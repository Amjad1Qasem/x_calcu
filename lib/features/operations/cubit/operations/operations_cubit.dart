import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_calcu/features/operations/data/operations_model.dart';
import 'package:x_calcu/features/operations/data/operation_request_model.dart';
import 'package:x_calcu/features/operations/data/operations_repo.dart';
import 'package:x_calcu/global/utils/functions/format_time.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';

part 'operations_state.dart';
part 'operations_cubit.freezed.dart';

class OperationsCubit extends Cubit<OperationsState> {
  final OperationsRepo _operationsRepo;
  OperationsCubit(this._operationsRepo) : super(const OperationsState());

  final GlobalKey<FormState> addOperationsKey = GlobalKey();
  bool isOutput = false;
  int? selectedPartnerId; // Add this field to store selected partner ID

  // Controllers
  final TextEditingController partnerNameController = TextEditingController();
  final TextEditingController customerController = TextEditingController();
  final TextEditingController invoiceNumberController = TextEditingController();
  final TextEditingController invoiceValueController = TextEditingController();
  final TextEditingController remainingInvoiceController =
      TextEditingController();
  final TextEditingController totalDueController = TextEditingController();
  final TextEditingController remainingAmountController =
      TextEditingController();
  final TextEditingController operationDateController = TextEditingController();
  final TextEditingController reminderDateController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  final TextEditingController percentageAmountController =
      TextEditingController();
  final TextEditingController percentageController = TextEditingController();
  final TextEditingController paidAmountController = TextEditingController();
  final TextEditingController paidDateController = TextEditingController();
  final TextEditingController receivedAmountController =
      TextEditingController();
  final TextEditingController receivedDateController = TextEditingController();
  final TextEditingController operationTypeController = TextEditingController();
  final TextEditingController totalPaidValueController =
      TextEditingController();
  final TextEditingController totalReceivedValueController =
      TextEditingController();

  void toggleOperationType() {
    isOutput = !isOutput;
    emit(state.copyWith(isOutputOperation: isOutput));
  }

  void resetState() {
    selectedPartnerId = null; // Reset partner ID
    emit(const OperationsState());
  }

  void setSelectedPartner(int partnerId, String partnerName) {
    selectedPartnerId = partnerId;
    partnerNameController.text = partnerName;
  }

  void initializeWithModel(OperationModel model) {
    // Basic fields
    partnerNameController.text = model.partnerName ?? '';
    customerController.text = model.clientName ?? '';
    operationTypeController.text = model.operationType ?? '';
    invoiceNumberController.text = model.invoiceNumber ?? '';
    invoiceValueController.text = model.invoiceValue?.toString() ?? '';
    remainingInvoiceController.text = model.remainingInvoice?.toString() ?? '';
    totalDueController.text = model.totalDue?.toString() ?? '';
    remainingAmountController.text = model.remainingAmount?.toString() ?? '';
    // Format operation date
    operationDateController.text = FormatTime.formatDate(model.operationDate);

    // Format reminder date
    reminderDateController.text = FormatTime.formatDate(model.reminderDate);
    notesController.text = model.notes ?? '';

    // Handle nested objects - Paid Invoice
    if (model.paidInvoice != null) {
      paidAmountController.text =
          model.paidInvoice!.totalPaidValue?.toString() ?? '';

      // Set total paid value
      totalPaidValueController.text =
          model.paidInvoice!.totalPaidValue?.toString() ?? '';

      // Get the first paid detail for the date
      if (model.paidInvoice!.paidDetails != null &&
          model.paidInvoice!.paidDetails!.isNotEmpty) {
        final firstPaidDetail = model.paidInvoice!.paidDetails!.first;
        paidDateController.text = FormatTime.formatDate(
          firstPaidDetail.invoiceDate,
        );
      }
    }

    // Handle nested objects - Percentage Details
    if (model.percentageDetails != null) {
      // Extract percentage value from the percentage string (e.g., "10%" -> "10")
      final percentageStr = model.percentageDetails!.percentage ?? '';
      final percentageValue = percentageStr.replaceAll('%', '');
      percentageController.text = percentageValue;

      // Set the calculated amount
      percentageAmountController.text =
          model.percentageDetails!.percentageValue?.toString() ?? '';
    }

    // Handle nested objects - Received Amount
    if (model.receivedAmount != null) {
      receivedAmountController.text =
          model.receivedAmount!.totalReceivedValue?.toString() ?? '';

      // Set total received value
      totalReceivedValueController.text =
          model.receivedAmount!.totalReceivedValue?.toString() ?? '';

      // Get the first received detail for the date
      if (model.receivedAmount!.receivedDetails != null &&
          model.receivedAmount!.receivedDetails!.isNotEmpty) {
        final firstReceivedDetail =
            model.receivedAmount!.receivedDetails!.first;
        receivedDateController.text = FormatTime.formatDate(
          firstReceivedDetail.invoiceDate,
        );
      }
    }

    // Set operation type toggle based on the model
    if (model.operationType != null) {
      isOutput = model.operationType!.toLowerCase() == 'output';
      emit(state.copyWith(isOutputOperation: isOutput));
    }

    emit(state.copyWith(operation: model));
  }

  Future<void> createOperation() async {
    emit(state.copyWith(isLoading: true, isError: false));

    // Create request model for API
    final requestModel = OperationRequestModel(
      partnerId: selectedPartnerId, // Use selected partner ID
      customerName: customerController.text,
      operationType: isOutput ? 'Output' : 'Input',
      invoiceNumber: invoiceNumberController.text,
      invoiceValue: double.tryParse(invoiceValueController.text),
      percentageOfBill: percentageController.text,
      invoiceDate: operationDateController.text,
      alertDate: reminderDateController.text,
      comments: notesController.text,
      paidBills: [
        PaidBillRequest(
          invoiceValue: paidAmountController.text,
          invoiceDate: paidDateController.text,
        ),
      ],
      receivedAmounts: [
        ReceivedAmountRequest(
          invoiceValue: receivedAmountController.text,
          invoiceDate: receivedDateController.text,
        ),
      ],
    );

    final result = await _operationsRepo.createOperation(data: requestModel);

    result.when(
      success:
          (data) => emit(state.copyWith(isSuccess: true, isLoading: false)),
      failure: (_) => emit(state.copyWith(isError: true, isLoading: false)),
    );
  }

  //* Get Operations Data */
  Future<void> getOperations() async {
    emit(state.copyWith(isLoading: true, isError: false));

    final result = await _operationsRepo.getOperationsData();

    result.when(
      success:
          (data) => emit(
            state.copyWith(isLoading: false, isError: false, operations: data),
          ),
      failure: (_) => emit(state.copyWith(isLoading: false, isError: true)),
    );
  }

  //* Get Operation Details */
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

  //* Update Operation */
  Future<void> updateOperation({required int operationId}) async {
    emit(state.copyWith(isLoading: true, isError: false));

    // Validate required fields
    // if (customerController.text.trim().isEmpty ||
    //     invoiceNumberController.text.trim().isEmpty ||
    //     invoiceValueController.text.trim().isEmpty ||
    //     percentageController.text.trim().isEmpty ||
    //     operationDateController.text.trim().isEmpty) {
    //   printError('Please fill in all required fields');
    //   emit(
    //     state.copyWith(
    //       isLoading: false,
    //       isError: true,
    //       errorMessage: 'Please fill in all required fields',
    //     ),
    //   );
    //   return;
    // }

    // Check if partner is selected
    if (selectedPartnerId == null) {
      emit(
        state.copyWith(
          isLoading: false,
          isError: true,
          errorMessage: 'Please select a partner',
        ),
      );
      return;
    }

    // Create request model for API
    final requestModel = OperationRequestModel(
      partnerId:
          selectedPartnerId, // Use selected partner ID instead of operationId
      customerName: customerController.text.trim(),
      operationType: isOutput ? 'Output' : 'Input',
      invoiceNumber: invoiceNumberController.text.trim(),
      invoiceValue: double.tryParse(invoiceValueController.text),
      percentageOfBill: percentageController.text.trim(),
      invoiceDate: operationDateController.text.trim(),
      alertDate: reminderDateController.text.trim(),
      comments: notesController.text.trim(),
      paidBills:
          paidAmountController.text.trim().isNotEmpty &&
                  paidDateController.text.trim().isNotEmpty
              ? [
                PaidBillRequest(
                  invoiceValue: paidAmountController.text.trim(),
                  invoiceDate: paidDateController.text.trim(),
                ),
              ]
              : null, // Only include if both fields have values
      receivedAmounts:
          receivedAmountController.text.trim().isNotEmpty &&
                  receivedDateController.text.trim().isNotEmpty
              ? [
                ReceivedAmountRequest(
                  invoiceValue: receivedAmountController.text.trim(),
                  invoiceDate: receivedDateController.text.trim(),
                ),
              ]
              : null, // Only include if both fields have values
    );

    final result = await _operationsRepo.updateOperation(
      operationId: operationId,
      data: requestModel,
    );

    result.when(
      success: (data) {
        printSuccess('data updated successfully :: $data');
        emit(state.copyWith(isSuccess: true, isLoading: false));
      },
      failure: (_) => emit(state.copyWith(isError: true, isLoading: false)),
    );
  }

  void dispose() {
    partnerNameController.dispose();
    customerController.dispose();
    invoiceNumberController.dispose();
    invoiceValueController.dispose();
    remainingInvoiceController.dispose();
    totalDueController.dispose();
    remainingAmountController.dispose();
    operationDateController.dispose();
    reminderDateController.dispose();
    notesController.dispose();
    percentageAmountController.dispose();
    percentageController.dispose();
    paidAmountController.dispose();
    paidDateController.dispose();
    receivedAmountController.dispose();
    receivedDateController.dispose();
    operationTypeController.dispose();
    totalPaidValueController.dispose();
    totalReceivedValueController.dispose();
  }
}
