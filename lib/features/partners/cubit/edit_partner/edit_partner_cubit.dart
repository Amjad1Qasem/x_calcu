import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_calcu/features/partners/cubit/partners/partner_cubit.dart';
import 'package:x_calcu/features/partners/data/models/partner_model.dart';
import 'package:x_calcu/features/partners/data/repo/partner_repo.dart';
import 'package:x_calcu/global/networking/failure.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';

part 'edit_partner_state.dart';
part 'edit_partner_cubit.freezed.dart';

class EditPartnerCubit extends Cubit<EditPartnerState> {
  final PartnerRepo _partnerRepo;
  EditPartnerCubit(this._partnerRepo) : super(const EditPartnerState());

  final GlobalKey<FormState> editPartnerFormKey = GlobalKey<FormState>();
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
    emit(state.copyWith(isError: false, errorMessage: ''));
  }

  // Method to reset form
  void resetForm() {
    companyNameController.clear();
    companyNumberController.clear();
    companyEmailController.clear();
    validationErrors.clear();
    emit(const EditPartnerState());
  }

  // Method to reset state
  void resetState() {
    companyNameController.clear();
    companyNumberController.clear();
    companyEmailController.clear();
    validationErrors.clear();
    emit(const EditPartnerState());
  }

  // Initialize with partner model data
  void initializeWithModel(PartnerModel model) {
    companyNameController.text = model.name ?? '';
    companyNumberController.text = model.phone ?? '';
    companyEmailController.text = model.email ?? '';

    printSuccess('EditPartnerCubit initialized with: ${model.name}');
    emit(state.copyWith(partner: model));
  }

  Future<void> updatePartner({required int partnerId}) async {
    // Clear previous validation errors
    clearValidationErrors();
    emit(state.copyWith(isLoading: true, isError: false, errorMessage: ''));

    // Validate required fields
    if (companyNameController.text.trim().isEmpty) {
      emit(
        state.copyWith(
          isLoading: false,
          isError: true,
          errorMessage: 'partner_name_is_required'.tr(),
        ),
      );
      return;
    }

    // Validate email format if provided
    if (companyEmailController.text.trim().isNotEmpty) {
      final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      if (!emailRegex.hasMatch(companyEmailController.text.trim())) {
        emit(
          state.copyWith(
            isLoading: false,
            isError: true,
            errorMessage: 'invalid_email_format'.tr(),
          ),
        );
        return;
      }
    }

    // Validate phone format if provided
    if (companyNumberController.text.trim().isNotEmpty) {
      final phoneRegex = RegExp(r'^[\+]?[0-9\s\-\(\)]{7,15}$');
      if (!phoneRegex.hasMatch(companyNumberController.text.trim())) {
        emit(
          state.copyWith(
            isLoading: false,
            isError: true,
            errorMessage: 'invalid_phone_format'.tr(),
          ),
        );
        return;
      }
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

    printInfo('Updating partner with data: $data');
    final response = await _partnerRepo.updatePartner(
      id: partnerId,
      data: data,
    );

    response.when(
      success: (partnerData) {
        printSuccess('Partner updated successfully: $partnerData');

        // Refresh partners list
        getIt<PartnerCubit>().getPartners(refresh: true);

        emit(
          state.copyWith(
            isLoading: false,
            isError: false,
            isSuccess: true,
            data: partnerData,
          ),
        );
      },
      failure: (error) {
        printError('Failed to update partner: $error');
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
          emit(
            state.copyWith(
              isError: true,
              isLoading: false,
              errorMessage: error.message,
            ),
          );
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
