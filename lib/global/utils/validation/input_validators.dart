import 'package:easy_localization/easy_localization.dart';

class InputValidators {
  // Validate numeric input (int or double)
  static String? validateNumeric(String? value, {bool isRequired = true}) {
    if (value == null || value.trim().isEmpty) {
      return isRequired ? 'field_required'.tr() : null;
    }

    // Remove any whitespace
    final cleanValue = value.trim();

    // Check if the value contains only numbers and at most one decimal point
    final numericRegex = RegExp(r'^[0-9]+(\.[0-9]+)?$');

    if (!numericRegex.hasMatch(cleanValue)) {
      return 'only_numbers_allowed'.tr();
    }

    // Try to parse as double to ensure it's a valid number
    final parsedValue = double.tryParse(cleanValue);
    if (parsedValue == null) {
      return 'invalid_number'.tr();
    }

    return null;
  }

  // Validate integer input
  static String? validateInteger(String? value, {bool isRequired = true}) {
    if (value == null || value.trim().isEmpty) {
      return isRequired ? 'field_required'.tr() : null;
    }

    final cleanValue = value.trim();

    // Check if the value contains only integers (no decimal points)
    final integerRegex = RegExp(r'^[0-9]+$');

    if (!integerRegex.hasMatch(cleanValue)) {
      return 'only_integers_allowed'.tr();
    }

    // Try to parse as int to ensure it's a valid integer
    final parsedValue = int.tryParse(cleanValue);
    if (parsedValue == null) {
      return 'invalid_integer'.tr();
    }

    return null;
  }

  // Validate percentage (0-100)
  static String? validatePercentage(String? value, {bool isRequired = true}) {
    final numericValidation = validateNumeric(value, isRequired: isRequired);
    if (numericValidation != null) {
      return numericValidation;
    }

    if (value != null && value.trim().isNotEmpty) {
      final parsedValue = double.tryParse(value.trim());
      if (parsedValue != null && (parsedValue < 0 || parsedValue > 100)) {
        return 'percentage_range_error'.tr();
      }
    }

    return null;
  }

  // Validate required field
  static String? validateRequired(String? value, {String? fieldName}) {
    if (value == null || value.trim().isEmpty) {
      return fieldName != null
          ? tr('field_name_required', args: [fieldName])
          : 'field_required'.tr();
    }
    return null;
  }
}
