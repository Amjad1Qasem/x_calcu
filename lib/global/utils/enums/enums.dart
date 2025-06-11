import 'package:flutter/material.dart';

enum Language {
  english(Locale('en'), 'English', AssetImage("assets/icons/us.png")),
  arabic(Locale('ar'), 'العربية', AssetImage("assets/icons/sy.png"));
  // english(Locale('en', 'US'), 'English', AssetImage("assets/Icons/us.png")),
  // arabic(Locale('ar', 'SY'), 'العربية', AssetImage("assets/Icons/sa.png"));

  /// Add another languages support here
  const Language(this.value, this.text, this.image);

  final Locale value;
  final AssetImage image; // Optional: this properties used for ListTile details
  final String text; // Optional: this properties used for ListTile details
}
