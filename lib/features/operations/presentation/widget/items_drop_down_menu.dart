import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_calcu/features/operations/cubit/get_partner/get_partner_cubit.dart';
import 'package:x_calcu/features/operations/data/operations_model.dart';
import 'package:x_calcu/global/components/form_label_widget.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';

class ItemsDropDownMenu extends StatelessWidget {
  const ItemsDropDownMenu({
    super.key,
    required this.label,
    required this.controller,
    this.onChanged,
  });

  final String label;
  final TextEditingController controller;
  final Function(DropDownModel)? onChanged;

  @override
  Widget build(BuildContext context) {
    final cubit = getIt<GetPartnerCubit>();

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormLabelWidget(label: label),
          CommonSizes.vSmallestSpace,
          BlocBuilder<GetPartnerCubit, GetPartnerState>(
            bloc: cubit..getOperationsDropdown(),
            builder: (context, state) {
              if (state.isLoading) {
                return _buildDisabledDropdown('loading'.tr());
              }

              if (state.isError) {
                return GestureDetector(
                  onTap: cubit.getOperationsDropdown,
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

              final items = state.fielData;
              DropDownModel? selectedItem;

              if (controller.text.isNotEmpty) {
                selectedItem = items.firstWhere(
                  (e) =>
                      e.name?.trim().toLowerCase() ==
                      controller.text.trim().toLowerCase(),
                  orElse: () => DropDownModel(id: 0, name: ''),
                );
              }

              return DropdownButtonFormField<DropDownModel>(
                value: selectedItem?.id != 0 ? selectedItem : null,
                isExpanded: true,
                items:
                    items.map((e) {
                      return DropdownMenuItem<DropDownModel>(
                        value: e,
                        child: Text(e.name ?? ''),
                      );
                    }).toList(),
                onChanged: (model) {
                  if (model == null) return;
                  controller.text = model.name ?? '';
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
                ),
              );
            },
          ),
        ],
      ),
    );
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
        ),
      ),
    );
  }
}
