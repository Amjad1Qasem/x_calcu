import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_calcu/features/companies/data/companies_model.dart';
import 'package:x_calcu/features/companies/data/companies_repo.dart';

part 'companies_state.dart';
part 'companies_cubit.freezed.dart';

class CompaniesCubit extends Cubit<CompaniesState> {
final CompaniesRepo _companiesRepo;
  CompaniesCubit(this._companiesRepo) : super(CompaniesState());

  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController companyNumberController = TextEditingController();
  final TextEditingController companyEmailController = TextEditingController();

  // Future<void> getCompanies() async {
  //   emit(state.copyWith(isLoading: true, isError: false));
  //   final response = await _companiesRepo.getCompaniesData();

  //   response.when(
  //     success: (data) {
  //       emit(state.copyWith(isLoading: false, isError: false, data: data));
  //     },
  //     failure: (_) => emit(state.copyWith(isLoading: false, isError: true)),
  //   );
  // }

  // Future<void> createCompany() async {
  //   emit(state.copyWith(isLoading: true, isError: false));
  //   final data = CompaniesModel(
  //     name: companyNameController.text,
  //     number: companyNumberController.text,
  //     email: companyEmailController.text,
  //   );
  //   final response = await _companiesRepo.createCompany(data: data);

  //   response.when(
  //     success: (data) {
  //       emit(state.copyWith(isLoading: false, isError: false, data: data));
  //     },
  //     failure: (_) => emit(state.copyWith(isLoading: false, isError: true)),
  //   );
  // }
}
