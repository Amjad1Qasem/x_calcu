import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_calcu/features/operations/data/operation_request_model.dart';
import 'package:x_calcu/features/operations/data/operations_repo.dart';
import 'package:x_calcu/features/notification/data/notification_model.dart';
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

  // Form and validation
  final GlobalKey<FormState> createOperationKey = GlobalKey();
  Map<String, dynamic> validationErrors = {};

  // Operation state
  bool isOutput = false;
  int? selectedPartnerId;
  DateTime? selectedReminderDateTime;

  /// Gets error message for a specific field
  String? getFieldError(String fieldName) {
    final errors = validationErrors[fieldName];
    if (errors is List && errors.isNotEmpty) {
      return errors.first.toString();
    }
    return null;
  }

  /// Clears all validation errors
  void clearValidationErrors() {
    validationErrors.clear();
    emit(state.copyWith(isError: false, errorMessage: ''));
  }

  // Text Controllers
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

  // Dynamic payment lists
  List<DynamicPaymentItem> paidBills = [];
  List<DynamicPaymentItem> receivedAmounts = [];

  // ==================== Operation Type Management ====================

  /// Toggles between input and output operation types
  void toggleOperationType() {
    isOutput = !isOutput;
    emit(state.copyWith(isOutputOperation: isOutput));
  }

  // ==================== Partner Management ====================

  /// Sets the selected partner
  void setSelectedPartner(int partnerId, String partnerName) {
    print(
      'setSelectedPartner called: partnerId=$partnerId, partnerName=$partnerName',
    );
    selectedPartnerId = partnerId;
    partnerNameController.text = partnerName;
    print('selectedPartnerId set to: $selectedPartnerId');
  }

  // ==================== Dynamic Payment Management ====================

  /// Updates paid bills list
  void updatePaidBills(List<DynamicPaymentItem> newPaidBills) {
    paidBills = newPaidBills;
    _updateTotalPaidAmount();
    triggerAllCalculations();
    printSuccess('Updated paid bills: ${paidBills.length} items');
  }

  /// Updates received amounts list
  void updateReceivedAmounts(List<DynamicPaymentItem> newReceivedAmounts) {
    receivedAmounts = newReceivedAmounts;
    _updateTotalReceivedAmount();
    triggerAllCalculations();
    printSuccess('Updated received amounts: ${receivedAmounts.length} items');
  }

  /// Updates total paid amount from dynamic list
  void _updateTotalPaidAmount() {
    final total = paidBills.fold(0.0, (sum, item) {
      return sum + (double.tryParse(item.invoiceValue) ?? 0);
    });
    paidAmountController.text = _formatNumber(total);
    totalPaidValueController.text = _formatNumber(total);
  }

  /// Updates total received amount from dynamic list
  void _updateTotalReceivedAmount() {
    final total = receivedAmounts.fold(0.0, (sum, item) {
      return sum + (double.tryParse(item.invoiceValue) ?? 0);
    });
    receivedAmountController.text = _formatNumber(total);
    totalReceivedValueController.text = _formatNumber(total);
  }

  // ==================== State Management ====================

  /// Resets the entire form and state
  void resetState({bool preservePartner = false}) {
    final preservedPartnerId = preservePartner ? selectedPartnerId : null;
    final preservedPartnerName =
        preservePartner ? partnerNameController.text : '';

    _resetOperationState();
    _clearAllControllers();
    _emitResetState();

    // Restore partner if requested
    if (preservePartner && preservedPartnerId != null) {
      selectedPartnerId = preservedPartnerId;
      partnerNameController.text = preservedPartnerName;
    }
  }

  /// Resets operation-specific state
  void _resetOperationState() {
    selectedPartnerId = null;
    isOutput = false;
    selectedReminderDateTime = null;
    validationErrors.clear();
  }

  /// Clears all text controllers
  void _clearAllControllers() {
    final controllers = [
      partnerNameController,
      customerController,
      invoiceNumberController,
      invoiceValueController,
      remainingInvoiceController,
      totalDueController,
      remainingAmountController,
      operationDateController,
      reminderDateController,
      notesController,
      percentageAmountController,
      percentageController,
      paidAmountController,
      paidDateController,
      receivedAmountController,
      receivedDateController,
      operationTypeController,
      totalPaidValueController,
      totalReceivedValueController,
    ];

    for (final controller in controllers) {
      controller.clear();
    }
  }

  /// Emits the reset state
  void _emitResetState() {
    emit(
      state.copyWith(
        isSuccess: false,
        isError: false,
        errorMessage: '',
        isOutputOperation: false,
      ),
    );
  }

  // ==================== Test Data Management ====================

  /// Fills all fields with test data for development purposes
  void fillTestData() {
    _setTestPartner();
    _setTestBasicFields();
    _setTestDates();
    _setTestAmounts();
    _setTestNotes();
    _setTestOperationType();
    clearValidationErrors();
  }

  /// Sets test partner data
  void _setTestPartner() {
    selectedPartnerId = 1;
    partnerNameController.text = 'Test Partner';
  }

  /// Sets test basic field data
  void _setTestBasicFields() {
    customerController.text = 'Test Customer';
    invoiceNumberController.text = '12345';
    invoiceValueController.text = '10000';
    remainingInvoiceController.text = '5000';
    totalDueController.text = '8000';
    remainingAmountController.text = '3000';
  }

  /// Sets test date fields
  void _setTestDates() {
    final today = DateTime.now();
    final tomorrow = today.add(const Duration(days: 1));

    operationDateController.text = "${today.year}/${today.month}/${today.day}";
    selectedReminderDateTime = tomorrow;
    reminderDateController.text =
        "${tomorrow.year}/${tomorrow.month}/${tomorrow.day} - 09:00";
  }

  /// Sets test amount fields
  void _setTestAmounts() {
    final today = DateTime.now();
    final todayStr = "${today.year}/${today.month}/${today.day}";

    // Percentage fields
    percentageController.text = '10';
    percentageAmountController.text = '1000';

    // Paid amount fields
    paidAmountController.text = '2000';
    paidDateController.text = todayStr;
    totalPaidValueController.text = '2000';

    // Received amount fields
    receivedAmountController.text = '1500';
    receivedDateController.text = todayStr;
    totalReceivedValueController.text = '1500';

    // Trigger auto-calculations after setting test data
    triggerAllCalculations();
  }

  /// Sets test notes
  void _setTestNotes() {
    notesController.text = 'This is a test operation for development purposes.';
  }

  /// Sets test operation type
  void _setTestOperationType() {
    isOutput = false;
    emit(state.copyWith(isOutputOperation: false));
  }

  // ==================== Auto Calculation Methods ====================

  /// Auto-calculates percentage value = (paid_amount * percentage) / 100
  void calculatePercentageValue() {
    final paidAmount = double.tryParse(paidAmountController.text) ?? 0;
    final percentage = double.tryParse(percentageController.text) ?? 0;
    final percentageValue = (paidAmount * percentage) / 100;
    percentageAmountController.text = _formatNumber(percentageValue);
    printSuccess('Calculated percentage value: $percentageValue');
  }

  /// Auto-calculates remaining invoice = invoice_value - paid_amount
  void calculateRemainingInvoice() {
    final invoiceValue = double.tryParse(invoiceValueController.text) ?? 0;
    final paidAmount = double.tryParse(paidAmountController.text) ?? 0;
    final remaining = invoiceValue - paidAmount;
    remainingInvoiceController.text = _formatNumber(remaining);
    printSuccess('Calculated remaining invoice: $remaining');
  }

  /// Auto-calculates total due = paid_amount - percentage_value
  void calculateTotalDue() {
    final paidAmount = double.tryParse(paidAmountController.text) ?? 0;
    final percentageValue =
        double.tryParse(percentageAmountController.text) ?? 0;
    final totalDue = paidAmount - percentageValue;
    totalDueController.text = _formatNumber(totalDue);
    printSuccess('Calculated total due: $totalDue');
  }

  /// Auto-calculates remaining amount = total_due - received_amount
  void calculateRemainingAmount() {
    final totalDue = double.tryParse(totalDueController.text) ?? 0;
    final receivedAmount = double.tryParse(receivedAmountController.text) ?? 0;
    final remaining = totalDue - receivedAmount;
    remainingAmountController.text = _formatNumber(remaining);
    printSuccess('Calculated remaining amount: $remaining');
  }

  /// Triggers all auto-calculations
  void triggerAllCalculations() {
    printSuccess('Triggering all auto-calculations...');
    calculatePercentageValue();
    calculateRemainingInvoice();
    calculateTotalDue();
    calculateRemainingAmount();
    printSuccess('Auto-calculations completed');
  }

  /// Formats number to remove unnecessary decimal zeros
  String _formatNumber(double value) {
    if (value == value.toInt().toDouble()) {
      return value.toInt().toString();
    }
    return value.toString();
  }

  // ==================== Operation Creation ====================

  /// Creates a new operation
  Future<void> createOperation() async {
    clearValidationErrors();
    emit(state.copyWith(isLoading: true, isError: false, errorMessage: ''));

    if (!_validateRequiredFields()) {
      printError('Please fill in all required fields');
      _emitValidationError();
      return;
    }

    final requestModel = _buildRequestModel();
    final result = await _operationsRepo.createOperation(data: requestModel);

    await result.when(
      success: (data) async {
        await _handleCreateSuccess(data);
      },
      failure: (error) {
        _handleCreateFailure(error);
      },
    );
  }

  /// Validates all required fields
  bool _validateRequiredFields() {
    printError('CreateOperationCubit _validateRequiredFields called');
    printError('selectedPartnerId: $selectedPartnerId');
    printError(
      'customerController.text.trim(): ${customerController.text.trim()}',
    );
    printError(
      'invoiceNumberController.text.trim(): ${invoiceNumberController.text.trim()}',
    );
    printError(
      'invoiceValueController.text.trim(): ${invoiceValueController.text.trim()}',
    );
    printError(
      'percentageController.text.trim(): ${percentageController.text.trim()}',
    );
    printError(
      'operationDateController.text.trim(): ${operationDateController.text.trim()}',
    );

    // Required fields only: partner, customer, invoice number, invoice value, percentage, operation date
    // Optional fields: notes, reminder date, paid amounts, received amounts
    return selectedPartnerId != null &&
        customerController.text.trim().isNotEmpty &&
        invoiceNumberController.text.trim().isNotEmpty &&
        invoiceValueController.text.trim().isNotEmpty &&
        percentageController.text.trim().isNotEmpty &&
        operationDateController.text.trim().isNotEmpty;
  }

  /// Emits validation error state
  void _emitValidationError() {
    emit(
      state.copyWith(
        isLoading: false,
        isError: true,
        isSuccess: false,
        errorMessage:
            'please_fill_in_all_required_fields_and_select_a_partner'.tr(),
      ),
    );
  }

  /// Builds the operation request model
  OperationRequestModel _buildRequestModel() {
    return OperationRequestModel(
      partnerId: selectedPartnerId,
      customerName: customerController.text.trim(),
      operationType: isOutput ? 'Output' : 'Input',
      invoiceNumber: invoiceNumberController.text.trim(),
      invoiceValue: double.tryParse(invoiceValueController.text),
      percentageOfBill: percentageController.text.trim(),
      invoiceDate: operationDateController.text.trim(),
      alertDate: _getFormattedAlertDate(),
      comments: notesController.text.trim(),
      paidBills: _buildPaidBills(),
      receivedAmounts: _buildReceivedAmounts(),
    );
  }

  /// Gets formatted alert date for API
  String? _getFormattedAlertDate() {
    return selectedReminderDateTime != null
        ? DateTimeHelper.formatDateTimeForAPI(selectedReminderDateTime!)
        : null;
  }

  /// Builds paid bills list from dynamic items
  List<PaidBillRequest>? _buildPaidBills() {
    if (paidBills.isEmpty) return null;

    return paidBills
        .where(
          (item) => item.invoiceValue.isNotEmpty && item.invoiceDate.isNotEmpty,
        )
        .map(
          (item) => PaidBillRequest(
            invoiceValue: item.invoiceValue,
            invoiceDate: item.invoiceDate,
          ),
        )
        .toList();
  }

  /// Builds received amounts list from dynamic items
  List<ReceivedAmountRequest>? _buildReceivedAmounts() {
    if (receivedAmounts.isEmpty) return null;

    return receivedAmounts
        .where(
          (item) => item.invoiceValue.isNotEmpty && item.invoiceDate.isNotEmpty,
        )
        .map(
          (item) => ReceivedAmountRequest(
            invoiceValue: item.invoiceValue,
            invoiceDate: item.invoiceDate,
          ),
        )
        .toList();
  }

  /// Handles successful operation creation
  Future<void> _handleCreateSuccess(dynamic data) async {
    printSuccess('Operation created successfully: $data');

    if (selectedReminderDateTime != null) {
      // Extract operation ID from the response
      final operationId = data?.id;
      await _scheduleReminderNotificationSafely(operationId: operationId);
    }

    emit(
      state.copyWith(
        isSuccess: true,
        isError: false,
        errorMessage: '',
        isLoading: false,
      ),
    );
  }

  /// Handles operation creation failure
  void _handleCreateFailure(dynamic error) {
    if (error is ValidationInputError) {
      _handleValidationError(error);
    } else {
      _handleGenericError(error);
    }
  }

  /// Handles validation errors
  void _handleValidationError(ValidationInputError error) {
    validationErrors = error.errors ?? {};
    emit(
      state.copyWith(
        isError: true,
        isLoading: false,
        isSuccess: false,
        errorMessage: error.message,
      ),
    );
  }

  /// Handles generic errors
  void _handleGenericError(dynamic error) {
    printError('Failed to create operation: $error');
    emit(
      state.copyWith(
        isError: true,
        isSuccess: false,
        isLoading: false,
        errorMessage: 'failed_to_create_operation'.tr(),
      ),
    );
  }

  /// Schedules reminder notification safely
  Future<void> _scheduleReminderNotificationSafely({int? operationId}) async {
    try {
      await _scheduleReminderNotification(operationId: operationId);
    } catch (e, s) {
      printError('Failed to schedule notification: $s');
      printError('Failed to schedule notification: $e');
    }
  }

  // ==================== Reminder Management ====================

  /// Sets reminder date and time
  void setReminderDateTime(DateTime dateTime) {
    selectedReminderDateTime = dateTime;
    reminderDateController.text = DateTimeHelper.formatDateTimeForDisplay(
      dateTime,
    );
  }

  ///(step_1) Schedules reminder notification)(Storage Operation)
  Future<void> _scheduleReminderNotification({int? operationId}) async {
    if (selectedReminderDateTime == null) {
      printWarning('⚠️ No reminder date selected, skipping notification');
      return;
    }

    try {
      final clientName =
          customerController.text.trim().isEmpty
              ? 'unknown_client'.tr()
              : customerController.text.trim();
      final notificationId = DateTime.now().millisecondsSinceEpoch.remainder(
        100000,
      );
      final reminderTime = selectedReminderDateTime!;

      printInfo('🔔 Scheduling notification for: $reminderTime');
      printInfo('👤 Client: $clientName');
      printInfo('💰 Amount: ${invoiceValueController.text}');
      printInfo('🆔 Operation ID: $operationId');

      await NotificationService.scheduleNotification(
        id: notificationId,
        title:
            isOutput
                ? 'output_notification_title'.tr()
                : 'input_notification_title'.tr(),
        body:
            isOutput
                ? 'output_notification_body'.tr(
                  namedArgs: {"clientName": clientName},
                )
                : 'input_notification_body'.tr(
                  namedArgs: {"clientName": clientName},
                ),
        payload: 'go_to_notifications',
        scheduledTime: reminderTime,
        type: isOutput ? NotificationType.output : NotificationType.input,
        operationId:
            operationId ?? notificationId, // Use real operationId if available
        partnerName:
            partnerNameController.text.trim().isNotEmpty
                ? partnerNameController.text.trim()
                : null,
        customerName: clientName,
        amount: double.tryParse(invoiceValueController.text),
      );

      printSuccess('✅ إشعار مجدول عند: $reminderTime');
    } catch (e) {
      printError('⚠️ خطأ في جدولة الإشعار: $e');
    }
  }

  // ==================== Resource Management ====================

  /// Disposes all controllers
  void dispose() {
    final controllers = [
      partnerNameController,
      customerController,
      invoiceNumberController,
      invoiceValueController,
      remainingInvoiceController,
      totalDueController,
      remainingAmountController,
      operationDateController,
      reminderDateController,
      notesController,
      percentageAmountController,
      percentageController,
      paidAmountController,
      paidDateController,
      receivedAmountController,
      receivedDateController,
      operationTypeController,
      totalPaidValueController,
      totalReceivedValueController,
    ];

    for (final controller in controllers) {
      controller.dispose();
    }
  }
}
