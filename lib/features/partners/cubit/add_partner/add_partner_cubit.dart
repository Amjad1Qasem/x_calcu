import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_calcu/features/partners/data/models/partner_model.dart';
import 'package:x_calcu/features/partners/data/repo/partner_repo.dart';
import 'package:x_calcu/global/networking/failure.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';

part 'add_partner_state.dart';
part 'add_partner_cubit.freezed.dart';

class AddPartnerCubit extends Cubit<AddPartnerState> {
  final PartnerRepo _partnerRepo;
  AddPartnerCubit(this._partnerRepo) : super(const AddPartnerState());

  final GlobalKey<FormState> addPartnerFormKey = GlobalKey<FormState>();
  Map<String, dynamic> validationErrors = {};

  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController companyNumberController = TextEditingController();
  final TextEditingController companyEmailController = TextEditingController();

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
    emit(state.copyWith(isError: false));
  }

  // Method to reset form
  void resetForm() {
    companyNameController.clear();
    companyNumberController.clear();
    companyEmailController.clear();
    validationErrors.clear();
    emit(const AddPartnerState());
  }

  Future<void> addPartner() async {
    // Clear previous validation errors
    clearValidationErrors();
    emit(state.copyWith(isLoading: true, isError: false));

    // Validate required fields
    if (companyNameController.text.trim().isEmpty) {
      emit(state.copyWith(isLoading: false, isError: true));
      return;
    }

    final data = PartnerModel(
      name: companyNameController.text.trim(),
      phone:
          companyNumberController.text.trim().isEmpty
              ? null
              : companyNumberController.text.trim(),
      email:
          companyEmailController.text.trim().isEmpty
              ? null
              : companyEmailController.text.trim(),
    );

    printInfo('Creating partner with data: $data');
    final response = await _partnerRepo.addPartner(data: data);

    response.when(
      success: (partnerData) {
        printSuccess('Partner created successfully: $partnerData');
        emit(
          state.copyWith(
            isLoading: false,
            isError: false,
            isSuccess: true,
            data: partnerData,
          ),
        );
        // Reset form after successful creation
        resetForm();
      },
      failure: (error) {
        printError('Failed to create partner: $error');
        if (error is ValidationInputError) {
          validationErrors = error.errors ?? {};
          emit(state.copyWith(isError: true, isLoading: false));
        } else {
          emit(state.copyWith(isError: true, isLoading: false));
        }
      },
    );
  }

  void dispose() {
    companyNameController.dispose();
    companyNumberController.dispose();
    companyEmailController.dispose();
  }
}
