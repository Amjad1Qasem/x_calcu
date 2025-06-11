import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Validation {
  String? serverMessage(String value, BuildContext context) {
    String? msg;
    if (value.isEmpty) {
      msg = "data_input_error".tr();
    } else {
      if (value.length < 5) {
        msg = "password_min_length".tr();
      } else {
        String pattern = r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
        RegExp regExp = RegExp(pattern);
        if (!regExp.hasMatch(value)) {
          msg = "password_requirements".tr();
        }
      }
    }
    return msg;
  }

  String? validatePassword(
    String value,
  ) {
    if (value.isEmpty) {
      return "empty_password".tr();
    }
    if (value.length < 8) {
      return "password_min_length".tr();
    }

    const pattern =
        r'^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    final regExp = RegExp(pattern);

    if (!regExp.hasMatch(value)) {
      return "password_requirements".tr();
    }

    return null;
  }

  String? validatePasswordOnlyLength(String value, int desirableLength) {
    if (value.isEmpty) {
      return "empty_password".tr();
    }
    if (value.length < desirableLength) {
      return "password_length"
          .tr(namedArgs: {"count": desirableLength.toString()});
    }
    return null;
  }

  String? validateVerificationCode(String value, int desirableLength) {
    if (value.isEmpty) {
      return "empty_code".tr();
    }
    if (value.length < desirableLength) {
      return "code_length".tr(namedArgs: {"count": desirableLength.toString()});
    }
    return null;
  }

  String? validateConfirmPassword(String value, String newpass) {
    if (value != newpass) {
      return "password_mismatch".tr();
    }
    if (value.isEmpty) {
      return "empty_password".tr();
    }
    return null;
  }

  String? validateOnlyEmptiness(String value) {
    if (value.isEmpty) {
      return "empty_password".tr();
    }
    return null;
  }

  String? validateLength(String? value, int desirableLength) {
    if (value == null || value.isEmpty) {
      return "required_field".tr();
    }
    if (value.length < desirableLength) {
      return "must_be_at_least"
          .tr(namedArgs: {"count": desirableLength.toString()});
    }
    return null;
  }

  String? validatePhoneNumber({required String value}) {
    // التعبير المنظم: أول رقم من 1-9، ثم 8 أرقام من 0-9
    // String pattern = r'^[1-9]\d{8}$';
    String pattern = r'^[1-9]\d{8,}$';
    RegExp regex = RegExp(pattern);

    if (value.isEmpty) {
      return "empty_phone".tr();
    }
    if (!regex.hasMatch(value)) {
      return "phone_length".tr(namedArgs: {"count": "9"});
    }
    return null;
  }

  String? validateReEnteredPassword(
      String newPassword, String confirmedPassword, BuildContext context) {
    if (confirmedPassword.isEmpty) {
      return "confirm_password".tr();
    }
    if (newPassword != confirmedPassword) {
      return "password_mismatch".tr();
    }
    return null;
  }

  String? validateEmail(
    String email,
  ) {
    // if (email.isEmpty) {
    //   return "email_required".tr(); // البريد الإلكتروني مطلوب
    // }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      return "invalid_email".tr(); // بريد إلكتروني غير صالح
    }

    return null;
  }

  String? validateName(String value, int desirableLength) {
    if (value.isEmpty) {
      return "empty_name".tr();
    }
    if (value.length < desirableLength) {
      return "name_length".tr(namedArgs: {"count": desirableLength.toString()});
    }
    return null;
  }

  String? validateEmpty(
    String value,
  ) {
    if (value.isEmpty) {
      return "field_should_not_empty".tr();
    }
    return null;
  }

  String? validateUserNamePhone(String? input) {
    if (input == null || input.isEmpty) {
      return "required_field".tr();
    }
    if (isPhoneNumber(input) || isUsername(input)) {
      return null;
    }
    return "invalid".tr();
  }

  bool isPhoneNumber(String input) {
    final phoneRegex = RegExp(r'^[1-9][0-9]{6,14}$');
    return phoneRegex.hasMatch(input);
  }

  bool isUsername(String input) {
    final usernameRegex = RegExp(r'^[a-zA-Z][a-zA-Z0-9_]{3,15}$');
    return usernameRegex.hasMatch(input);
  }

  String? validateLoc(String value, int desirableLength, BuildContext context) {
    if (value.isEmpty) {
      return "empty_location".tr();
    }
    if (value.length < desirableLength) {
      return "location_length"
          .tr(namedArgs: {"count": desirableLength.toString()});
    }
    return null;
  }
}
