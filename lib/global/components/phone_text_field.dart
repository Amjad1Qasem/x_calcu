// import 'dart:ui' as ui;
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:x_calcu/features/startup/bloc/country/country_cubit.dart';
// import 'package:x_calcu/global/components/text_field_app.dart';
// import 'package:x_calcu/global/core/app_state.dart';
// import 'package:x_calcu/global/design/common_sizes.dart';
// import 'package:x_calcu/global/design/themes/themes.dart';
// import 'package:x_calcu/global/utils/di/dependency_injection.dart';
// import 'package:x_calcu/global/utils/functions/validator.dart';
// import 'package:x_calcu/global/utils/helper/console_logger.dart';

// class PhoneTextField extends StatefulWidget {
//   const PhoneTextField({
//     super.key,
//     required this.controller,
//     required this.codeController,
//     this.focusNode,
//     this.onFieldSubmitted,
//     this.hintText,
//     this.onChanged,
//   });

//   final FocusNode? focusNode;
//   final Function(String)? onFieldSubmitted;
//   final TextEditingController codeController;
//   final TextEditingController controller;
//   final String? hintText;
//   final Function(String)? onChanged;

//   @override
//   State<PhoneTextField> createState() => _PhoneTextFieldState();
// }

// class _PhoneTextFieldState extends State<PhoneTextField> {
//   String? localValidationError;

//   @override
//   void initState() {
//     super.initState();
//     final cubit = getIt<CountryCubit>();

//     if (cubit.state.countryList.isEmpty) {
//       cubit.getCountryCode();
//     }

//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _setPhoneNumberFromFull(widget.controller.text);
//     });
//   }

//   void _setPhoneNumberFromFull(String fullPhone) {
//     final countries = getIt<CountryCubit>().state.countryList;
//     final code = _findCountryCodeFromPhone(fullPhone, countries);

//     if (code != null) {
//       widget.codeController.text = code;
//       widget.controller.text = fullPhone.substring(code.length);
//     } else {
//       widget.controller.text = fullPhone;
//     }
//     setState(() {});
//   }

//   String? _findCountryCodeFromPhone(
//       String phoneNumber, List<CountryModel> countries) {
//     final codes = countries
//         .map((e) => e.code)
//         .where((code) => code != null && code.isNotEmpty)
//         .map((code) => code!)
//         .toList();

//     codes.sort((a, b) => b.length.compareTo(a.length)); // longest match first

//     for (final code in codes) {
//       if (phoneNumber.startsWith(code)) {
//         return code;
//       }
//     }
//     return null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final bool rtl = getIt<AppStateModel>().rtl;
//     final String? errorTextBloc =
//         getIt<AuthCubit>().validationErrors["phone_number"]?.first;

//     return Directionality(
//       textDirection: ui.TextDirection.ltr,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   BlocConsumer<CountryCubit, CountryState>(
//                     bloc: getIt<CountryCubit>(),
//                     listener: (context, state) {},
//                     builder: (context, state) {
//                       final cubit = getIt<CountryCubit>();
//                       final customCountries = state.countryList
//                           .map((country) => {
//                                 'code': country.isoCode ?? 'SY',
//                                 'dial_code': country.code ?? '+963',
//                                 'name': country.name ?? 'Country',
//                                 'flag_uri': country.flag ?? 'default_flag.png',
//                               })
//                           .toList();

//                       return Container(
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             color: (errorTextBloc != null ||
//                                     localValidationError != null)
//                                 ? Utils(context).red
//                                 : Utils(context).disableGrey,
//                             width: 1.5.w,
//                           ),
//                           borderRadius: BorderRadius.circular(8.r),
//                         ),
//                         height: 53.1.h,
//                         child: _buildCountrySelector(
//                           state,
//                           cubit,
//                           context,
//                           customCountries,
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//               CommonSizes.hSmallestSpace,
//               Expanded(
//                 flex: 4,
//                 child: TextFieldApp(
//                   padding: EdgeInsets.zero,
//                   hintText: widget.hintText ?? '9XX XXX XXX',
//                   keyboardType: TextInputType.phone,
//                   controller: widget.controller,
//                   focusNode: widget.focusNode,
//                   onChanged: (val) {
//                     widget.onChanged?.call(val);
//                     setState(() {
//                       localValidationError =
//                           Validation().validatePhoneNumber(value: val);
//                     });
//                   },
//                   onFieldSubmitted: widget.onFieldSubmitted,
//                   validation: (_) => null,
//                   errorText: null,
//                 ),
//               ),
//             ],
//           ),
//           if (localValidationError != null || errorTextBloc != null) ...[
//             SizedBox(height: 6.h),
//             Align(
//               alignment: rtl
//                   ? AlignmentDirectional.centerEnd
//                   : AlignmentDirectional.centerStart,
//               child: Text(
//                 localValidationError ?? errorTextBloc!,
//                 style: TextStyle(
//                   fontSize: 12.sp,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.red,
//                 ),
//               ),
//             ),
//           ],
//         ],
//       ),
//     );
//   }

//   Widget _buildCountrySelector(
//     CountryState state,
//     CountryCubit cubit,
//     BuildContext context,
//     List<Map<String, String>> countries,
//   ) {
//     if (state.isCountryLoading) {
//       return Padding(
//         padding: EdgeInsets.symmetric(horizontal: 22.sp, vertical: 6.sp),
//         child: const Center(
//           child: SizedBox(
//             width: 24,
//             height: 24,
//             child: CircularProgressIndicator(strokeWidth: 2),
//           ),
//         ),
//       );
//     }

//     if (state.isCountryError) {
//       return IconButton(
//         icon: Icon(Icons.refresh, size: 24.sp, color: Utils(context).primary),
//         onPressed: cubit.getCountryCode,
//       );
//     }

//     if (countries.isEmpty) {
//       return Center(
//         child: GestureDetector(
//           onTap: () => cubit.getCountryCode(),
//           child: Text(
//             '963'.tr(),
//             style: Utils(context).greyTextMedium.copyWith(fontSize: 13.sp),
//           ),
//         ),
//       );
//     }

//     return CountryCodePicker(
//       showFlag: false,
//       countryList: countries,
//       headerText: "select_country".tr(),
//       initialSelection: widget.codeController.text.isNotEmpty
//           ? widget.codeController.text.replaceAll('+', '')
//           : 'SY',
//       showFlagDialog: true,
//       flagWidth: 30.sp,
//       barrierColor: Colors.transparent,
//       backgroundColor: Utils(context).background,
//       textStyle: Utils(context)
//           .blueHeadlineText
//           .copyWith(fontSize: 13.sp, fontWeight: FontWeight.bold),
//       onChanged: (value) {
//         widget.codeController.text = value.dialCode ?? '963';
//         printWarning('text ${value.dialCode}');
//       },
//       showCountryOnly: true,
//     );
//   }
// }
