import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_calcu/features/operations/cubit/get_partner/get_partner_cubit.dart';
import 'package:x_calcu/features/operations/cubit/edit_operation/edit_operation_cubit.dart';
import 'package:x_calcu/features/operations/cubit/create_operation/create_operation_cubit.dart';
import 'package:x_calcu/features/operations/cubit/operations/operations_cubit.dart';
import 'package:x_calcu/features/operations/data/operations_model.dart';
import 'package:x_calcu/features/operations/data/cubit_type.dart';
import 'package:x_calcu/global/components/form_label_widget.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';

class ItemsDropDownMenu extends StatelessWidget {
  const ItemsDropDownMenu({
    super.key,
    required this.label,
    required this.controller,
    this.onChanged,
    this.readOnly = false,
    this.cubitType = CubitType.create,
  });

  final String label;
  final TextEditingController controller;
  final Function(DropDownModel)? onChanged;
  final bool readOnly;
  final CubitType cubitType;

  @override
  Widget build(BuildContext context) {
    final cubit = getIt<GetPartnerCubit>();
    final operationsCubit = _getOperationsCubit();

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormLabelWidget(label: label),
          CommonSizes.vSmallestSpace,
          BlocBuilder<GetPartnerCubit, GetPartnerState>(
            bloc: cubit..getPartnersDropdown(),
            builder: (context, state) {
              // Loading state
              if (state.isLoading) {
                return _buildDisabledDropdown('loading'.tr());
              }

              // Error state
              if (state.isError) {
                return GestureDetector(
                  onTap: readOnly ? null : cubit.getPartnersDropdown,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.refresh, size: 18.sp),
                        SizedBox(width: 8.w),
                        Text(
                          'retry'.tr(),
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontFamily: 'Cairo',
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }

              // Success state with data
              final items = state.fielData ?? [];
              DropDownModel? selectedItem;

              // Find matching partner from the controller text
              if (controller.text.isNotEmpty) {
                selectedItem = items.firstWhere(
                  (e) =>
                      e.name?.trim().toLowerCase() ==
                      controller.text.trim().toLowerCase(),
                  orElse: () => DropDownModel(id: 0, name: ''),
                );

                // If we found a matching partner, set the selected partner ID in the operations cubit
                if (selectedItem.id != 0) {
                  operationsCubit.setSelectedPartner(
                    selectedItem.id!,
                    selectedItem.name!,
                  );
                }
              }

              return DropdownButtonFormField<DropDownModel>(
                initialValue: selectedItem?.id != 0 ? selectedItem : null,
                isExpanded: true,
                items:
                    items.map((e) {
                      return DropdownMenuItem<DropDownModel>(
                        value: e,
                        child: Text(e.name ?? ''),
                      );
                    }).toList(),
                onChanged:
                    readOnly
                        ? null
                        : (model) {
                          if (model == null) return;
                          controller.text = model.name ?? '';

                          // Set the selected partner in the operations cubit
                          operationsCubit.setSelectedPartner(
                            model.id ?? 0,
                            model.name ?? '',
                          );

                          onChanged?.call(model);
                        },
                decoration: InputDecoration(
                  hintText: 'please_select'.tr(),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 14,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color:
                          readOnly
                              ? Utils(context).disableGrey
                              : Utils(context).disableGrey,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Utils(context).disableGrey),
                  ),
                ),
                icon: readOnly ? null : const Icon(Icons.arrow_drop_down),
                isDense: true,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontFamily: 'Cairo',
                  color:
                      readOnly
                          ? Utils(context).secondTextColor
                          : Utils(context).normalText.color,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  dynamic _getOperationsCubit() {
    switch (cubitType) {
      case CubitType.edit:
        return getIt<EditOperationCubit>();
      case CubitType.create:
        return getIt<CreateOperationCubit>();
      case CubitType.view:
        return getIt<EditOperationCubit>(); // Use edit cubit for view mode
    }
  }

  Widget _buildDisabledDropdown(String hint) {
    return IgnorePointer(
      child: DropdownButtonFormField<String>(
        items: const [],
        onChanged: (_) {},
        decoration: InputDecoration(
          hintText: hint,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 14,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
        ),
      ),
    );
  }
}
