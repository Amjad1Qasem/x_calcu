import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_calcu/features/operations/data/operation_request_model.dart';
import 'package:x_calcu/features/operations/data/operations_repo.dart';
import 'package:x_calcu/global/networking/failure.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';
import 'package:x_calcu/global/utils/helper/date_time_helper.dart';
import 'package:x_calcu/notification_service.dart';
import 'package:easy_localization/easy_localization.dart';

part 'create_operation_state.dart';
part 'create_operation_cubit.freezed.dart';

class CreateOperationCubit extends Cubit<CreateOperationState> {
  final OperationsRepo _operationsRepo;
  CreateOperationCubit(this._operationsRepo)
    : super(const CreateOperationState());

  final GlobalKey<FormState> createOperationKey = GlobalKey();
  bool isOutput = false;
  int? selectedPartnerId;
  Map<String, dynamic> validationErrors = {};

  // Method to get error message for a specific field
  String? getFieldError(String fieldName) {
    final errors = validationErrors[fieldName];
    if (errors is List && errors.isNotEmpty) {
      return errors.first.toString();
    }
    return null;
  }

  // Method to clear validation errors
  void clearValidationErrors() {
    validationErrors.clear();
    emit(state.copyWith(isError: false, errorMessage: ''));
  }

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

  // Store the actual DateTime for API calls
  DateTime? selectedReminderDateTime;

  void toggleOperationType() {
    isOutput = !isOutput;
    emit(state.copyWith(isOutputOperation: isOutput));
  }

  void resetState() {
    selectedPartnerId = null;
    isOutput = false;
    validationErrors.clear();

    // Clear all controllers
    partnerNameController.clear();
    customerController.clear();
    invoiceNumberController.clear();
    invoiceValueController.clear();
    remainingInvoiceController.clear();
    totalDueController.clear();
    remainingAmountController.clear();
    operationDateController.clear();
    reminderDateController.clear();
    notesController.clear();
    percentageAmountController.clear();
    percentageController.clear();
    paidAmountController.clear();
    paidDateController.clear();
    receivedAmountController.clear();
    receivedDateController.clear();
    operationTypeController.clear();
    totalPaidValueController.clear();
    totalReceivedValueController.clear();
    selectedReminderDateTime = null;

    emit(const CreateOperationState());
  }

  void setSelectedPartner(int partnerId, String partnerName) {
    selectedPartnerId = partnerId;
    partnerNameController.text = partnerName;
  }

  Future<void> createOperation() async {
    // Clear previous validation errors
    clearValidationErrors();
    emit(state.copyWith(isLoading: true, isError: false, errorMessage: ''));

    // Validate required fields
    if (selectedPartnerId == null ||
        customerController.text.trim().isEmpty ||
        invoiceNumberController.text.trim().isEmpty ||
        invoiceValueController.text.trim().isEmpty ||
        percentageController.text.trim().isEmpty ||
        operationDateController.text.trim().isEmpty) {
      emit(
        state.copyWith(
          isLoading: false,
          isError: true,
          errorMessage:
              'Please fill in all required fields and select a partner',
        ),
      );
      return;
    }

    // Create request model for API
    final requestModel = OperationRequestModel(
      partnerId: selectedPartnerId,
      customerName: customerController.text.trim(),
      operationType: isOutput ? 'Output' : 'Input',
      invoiceNumber: invoiceNumberController.text.trim(),
      invoiceValue: double.tryParse(invoiceValueController.text),
      percentageOfBill: percentageController.text.trim(),
      invoiceDate: operationDateController.text.trim(),
      alertDate:
          selectedReminderDateTime != null
              ? DateTimeHelper.formatDateTimeForAPI(selectedReminderDateTime!)
              : null,
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
              : null,
      receivedAmounts:
          receivedAmountController.text.trim().isNotEmpty &&
                  receivedDateController.text.trim().isNotEmpty
              ? [
                ReceivedAmountRequest(
                  invoiceValue: receivedAmountController.text.trim(),
                  invoiceDate: receivedDateController.text.trim(),
                ),
              ]
              : null,
    );

    final result = await _operationsRepo.createOperation(data: requestModel);

    result.when(
      success: (data) {
        printSuccess('Operation created successfully: $data');

        // Schedule notification if reminder date is set
        if (selectedReminderDateTime != null) {
          _scheduleReminderNotification();
        }

        emit(state.copyWith(isSuccess: true, isLoading: false));
        // Reset form after successful creation
        resetState();
      },
      failure: (error) {
        if (error is ValidationInputError) {
          validationErrors = error.errors ?? {};
          emit(
            state.copyWith(
              isError: true,
              isLoading: false,
              errorMessage: error.message,
            ),
          );
        } else {
          printError('Failed to create operation: $error');
          emit(
            state.copyWith(
              isError: true,
              isLoading: false,
              errorMessage: 'Failed to create operation. Please try again.',
            ),
          );
        }
      },
    );
  }

  // Method to set reminder date and time
  void setReminderDateTime(DateTime dateTime) {
    selectedReminderDateTime = dateTime;
    reminderDateController.text = DateTimeHelper.formatDateTimeForDisplay(
      dateTime,
    );
  }

  // Method to schedule reminder notification
  Future<void> _scheduleReminderNotification() async {
    if (selectedReminderDateTime == null) return;

    try {
      final String clientName =
          customerController.text.trim().isEmpty
              ? 'unknown_client'.tr()
              : customerController.text.trim();

      // Generate unique notification ID
      final int notificationId = DateTime.now().millisecondsSinceEpoch
          .remainder(100000);

      // Schedule the notification
      await NotificationService.scheduleNotification(
        id: notificationId,
        title: 'notification_title'.tr(),
        body: 'notification_body'.tr(args: [clientName]),
        payload: 'go_to_notifications',
        scheduledTime: selectedReminderDateTime!,
      );

      printSuccess('✅ إشعار مجدول عند: $selectedReminderDateTime');
    } catch (e) {
      printError('⚠️ خطأ في جدولة الإشعار: $e');
    }
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
