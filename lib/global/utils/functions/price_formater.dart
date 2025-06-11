
import 'package:easy_localization/easy_localization.dart';
import 'package:x_calcu/global/core/app_state.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';

String formatPrice(dynamic price,
    {bool withCurrency = false, bool shortNumber = false}) {
  final appState = getIt<AppStateModel>();
  final locale =
      Intl.getCurrentLocale(); // Uses current locale set by EasyLocalization
  double value = double.tryParse(price.toString()) ?? 0.0;
  String currency = appState.currency;
  String formatted;

  // Manually localize suffixes without context
  String _localizedSuffix(String key) {
    switch (key) {
      case 'thousand':
        return tr('suffix.thousand');
      case 'million':
        return tr('suffix.million');
      case 'billion':
        return tr('suffix.billion');
      default:
        return '';
    }
  }

  String _formatShort(double val, String suffixKey) {
    String numStr =
        (val % 1 == 0) ? val.toStringAsFixed(0) : val.toStringAsFixed(1);
    return '$numStr ${_localizedSuffix(suffixKey)}';
  }

  if (shortNumber) {
    if (value >= 1e9) {
      formatted = _formatShort(value / 1e9, 'billion');
    } else if (value >= 1e6) {
      formatted = _formatShort(value / 1e6, 'million');
    } else if (value >= 1e3) {
      formatted = _formatShort(value / 1e3, 'thousand');
    } else {
      formatted = value.toStringAsFixed(0);
    }
  } else {
    formatted = NumberFormat.decimalPattern(locale).format(value);
  }

  return withCurrency ? '$formatted $currency' : formatted;
}
