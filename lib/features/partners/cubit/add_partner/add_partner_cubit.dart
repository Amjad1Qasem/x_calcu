import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_calcu/features/partners/data/models/partner_model.dart';
import 'package:x_calcu/features/partners/data/repo/partner_repo.dart';

part 'add_partner_state.dart';
part 'add_partner_cubit.freezed.dart';

class AddPartnerCubit extends Cubit<AddPartnerState> {
  final PartnerRepo _partnerRepo;
  AddPartnerCubit(this._partnerRepo) : super(AddPartnerState());
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController companyNumberController = TextEditingController();
  final TextEditingController companyEmailController = TextEditingController();

  

  Future<void> addPartner() async {
    emit(state.copyWith(isLoading: true, isError: false));
    final data = PartnerModel(
      name: companyNameController.text,
      phone: companyNumberController.text,
      email: companyEmailController.text,
    );
    final response = await _partnerRepo.addPartner(data: data);

    response.when(
      success: (data) {
        emit(state.copyWith(isLoading: false, isError: false, data: data));
      },
      failure: (_) => emit(state.copyWith(isLoading: false, isError: true)),
    );
  }
}
