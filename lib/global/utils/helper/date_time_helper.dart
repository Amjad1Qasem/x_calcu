import 'package:easy_localization/easy_localization.dart';

class DateTimeHelper {
  /// Format DateTime for API (ISO 8601 format: 2025-09-30T09:00:00Z)
  static String formatDateTimeForAPI(DateTime dateTime) {
    return dateTime.toIso8601String();
  }

  /// Format DateTime for display (2025/09/30 - 9:00 AM)
  static String formatDateTimeForDisplay(DateTime dateTime) {
    final DateFormat dateFormat = DateFormat('yyyy/MM/dd');
    final DateFormat timeFormat = DateFormat('h:mm a');

    return "${dateFormat.format(dateTime)} - ${timeFormat.format(dateTime)}";
  }

  /// Parse display format back to DateTime
  /// Input: "2025/09/30 - 9:00 AM"
  /// Output: DateTime object
  static DateTime? parseDisplayFormat(String displayString) {
    try {
      // Split by " - " to get date and time parts
      final parts = displayString.split(' - ');
      if (parts.length != 2) return null;

      final datePart = parts[0]; // "2025/09/30"
      final timePart = parts[1]; // "9:00 AM"

      // Parse date part
      final dateComponents = datePart.split('/');
      if (dateComponents.length != 3) return null;

      final year = int.tryParse(dateComponents[0]);
      final month = int.tryParse(dateComponents[1]);
      final day = int.tryParse(dateComponents[2]);

      if (year == null || month == null || day == null) return null;

      // Parse time part
      final timeFormat = DateFormat('h:mm a');
      final timeOnly = timeFormat.parse(timePart);

      // Combine date and time
      return DateTime(year, month, day, timeOnly.hour, timeOnly.minute);
    } catch (e) {
      return null;
    }
  }

  /// Format date only for API (YYYY-MM-DD format)
  static String formatDateForAPI(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  /// Check if the provided date is in the future
  static bool isFutureDate(DateTime dateTime) {
    return dateTime.isAfter(DateTime.now());
  }

  /// Check if reminder date is after or equal to invoice date
  static bool isValidReminderDate(DateTime reminderDate, DateTime invoiceDate) {
    // Remove time component for comparison
    final reminderDateOnly = DateTime(
      reminderDate.year,
      reminderDate.month,
      reminderDate.day,
    );
    final invoiceDateOnly = DateTime(
      invoiceDate.year,
      invoiceDate.month,
      invoiceDate.day,
    );

    return reminderDateOnly.isAfter(invoiceDateOnly) ||
        reminderDateOnly.isAtSameMomentAs(invoiceDateOnly);
  }
}
