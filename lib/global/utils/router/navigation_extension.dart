
import 'package:flutter/material.dart';

extension NewNavigation on BuildContext {
  void goNamed(String name, {Object? argument}) {
    FocusScope.of(this).unfocus();
    Navigator.of(this).popAndPushNamed(name, arguments: argument);
  }

  void pushNamed(String name, {Object? argument}) {
    FocusScope.of(this).unfocus();
    Navigator.of(this).pushNamed(name, arguments: argument);
  }

  void pushReplacementNamed(String name, {Object? argument}) {
    FocusScope.of(this).unfocus();
    Navigator.of(this).pushReplacementNamed(name, arguments: argument);
  }

  void pop() {
    FocusScope.of(this).unfocus();
    Navigator.of(this).pop();
  }
}
