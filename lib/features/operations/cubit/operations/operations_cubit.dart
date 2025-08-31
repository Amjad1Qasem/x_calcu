import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_calcu/features/operations/data/operations_model.dart';
import 'package:x_calcu/features/operations/data/operations_repo.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';

part 'operations_state.dart';
part 'operations_cubit.freezed.dart';

class OperationsCubit extends Cubit<OperationsState> {
  final OperationsRepo _operationsRepo;
  OperationsCubit(this._operationsRepo) : super(const OperationsState());

  final GlobalKey<FormState> addOperationsKey = GlobalKey();
  bool isOutput = false;

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

  void toggleOperationType() {
    isOutput = !isOutput;
    emit(state.copyWith(isOutputOperation: isOutput));
  }

  void initializeWithModel(OperationModel model) {
    partnerNameController.text = model.clientName ?? '';
    customerController.text = model.partnerName ?? '';
    invoiceNumberController.text = model.invoiceNumber ?? '';
    invoiceValueController.text = model.invoiceValue?.toString() ?? '';
    remainingInvoiceController.text = model.remainingInvoice?.toString() ?? '';
    totalDueController.text = model.totalDue?.toString() ?? '';
    remainingAmountController.text = model.remainingAmount?.toString() ?? '';
    operationDateController.text = model.operationDate ?? '';
    reminderDateController.text = model.reminderDate ?? '';
    notesController.text = model.notes ?? '';

    // Handle nested objects
    if (model.paidInvoice != null) {
      paidAmountController.text =
          model.paidInvoice!.totalPaidValue?.toString() ?? '';
      // You might want to handle the paid details list here
    }

    if (model.percentageDetails != null) {
      percentageController.text =
          model.percentageDetails!.percentageValue?.toString() ?? '';
      percentageAmountController.text =
          model.percentageDetails!.percentageValue?.toString() ?? '';
    }

    if (model.receivedAmount != null) {
      receivedAmountController.text =
          model.receivedAmount!.totalReceivedValue?.toString() ?? '';
      // You might want to handle the received details list here
    }

    emit(state.copyWith(operation: model));
  }

  Future<void> createOperation() async {
    emit(state.copyWith(isLoading: true, isError: false));

    // Create nested objects for the new model structure
    final paidInvoice = PaidInvoiceSummary(
      totalPaidValue: double.tryParse(paidAmountController.text) ?? 0,
      paidDetails: [
        PaidInvoiceDetail(
          invoiceValue: double.tryParse(paidAmountController.text) ?? 0,
          invoiceDate: paidDateController.text,
        ),
      ],
    );

    final percentageDetails = PercentageDetails(
      percentage: '${percentageController.text}%',
      percentageValue: double.tryParse(percentageController.text) ?? 0,
    );

    final receivedAmount = ReceivedAmountSummary(
      totalReceivedValue: double.tryParse(receivedAmountController.text) ?? 0,
      receivedDetails: [
        ReceivedAmountDetail(
          invoiceValue: double.tryParse(receivedAmountController.text) ?? 0,
          invoiceDate: receivedDateController.text,
        ),
      ],
    );

    final model = OperationModel(
      partnerName: customerController.text,
      clientName: partnerNameController.text,
      operationType: isOutput ? 'Output' : 'Input',
      invoiceNumber: invoiceNumberController.text,
      invoiceValue: double.tryParse(invoiceValueController.text) ?? 0,
      paidInvoice: paidInvoice,
      remainingInvoice: double.tryParse(remainingInvoiceController.text) ?? 0,
      percentageDetails: percentageDetails,
      totalDue: double.tryParse(totalDueController.text) ?? 0,
      receivedAmount: receivedAmount,
      remainingAmount: double.tryParse(remainingAmountController.text) ?? 0,
      operationDate: operationDateController.text,
      reminderDate: reminderDateController.text,
      notes: notesController.text,
    );

    final result = await _operationsRepo.createOperation(data: model);

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

    // Create nested objects for the new model structure
    final paidInvoice = PaidInvoiceSummary(
      totalPaidValue: double.tryParse(paidAmountController.text) ?? 0,
      paidDetails: [
        PaidInvoiceDetail(
          invoiceValue: double.tryParse(paidAmountController.text) ?? 0,
          invoiceDate: paidDateController.text,
        ),
      ],
    );

    final percentageDetails = PercentageDetails(
      percentage: '${percentageController.text}%',
      percentageValue: double.tryParse(percentageController.text) ?? 0,
    );

    final receivedAmount = ReceivedAmountSummary(
      totalReceivedValue: double.tryParse(receivedAmountController.text) ?? 0,
      receivedDetails: [
        ReceivedAmountDetail(
          invoiceValue: double.tryParse(receivedAmountController.text) ?? 0,
          invoiceDate: receivedDateController.text,
        ),
      ],
    );

    final model = OperationModel(
      partnerName: customerController.text,
      clientName: partnerNameController.text,
      operationType: isOutput ? 'Output' : 'Input',
      invoiceNumber: invoiceNumberController.text,
      invoiceValue: double.tryParse(invoiceValueController.text) ?? 0,
      paidInvoice: paidInvoice,
      remainingInvoice: double.tryParse(remainingInvoiceController.text) ?? 0,
      percentageDetails: percentageDetails,
      totalDue: double.tryParse(totalDueController.text) ?? 0,
      receivedAmount: receivedAmount,
      remainingAmount: double.tryParse(remainingAmountController.text) ?? 0,
      operationDate: operationDateController.text,
      reminderDate: reminderDateController.text,
      notes: notesController.text,
    );

    final result = await _operationsRepo.updateOperation(
      operationId: operationId,
      data: model,
    );

    result.when(
      success:
          (data) => emit(state.copyWith(isSuccess: true, isLoading: false)),
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
  }
}
