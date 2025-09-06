/// Date formatting utility functions
class FormatTime {
  /// Format date from "2025-09-02 00:00:00" to "2025/09/02"
  static String formatDate(String? dateString) {
    if (dateString == null || dateString.isEmpty) {
      return '';
    }
    
    try {
      final date = DateTime.parse(dateString);
      return "${date.year}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}";
    } catch (e) {
      // If parsing fails, return the original string
      return dateString;
    }
  }

  /// Format date from "2025-09-02 00:00:00" to "2025/09/02 - HH:MM"
  static String formatDateTime(String? dateString) {
    if (dateString == null || dateString.isEmpty) {
      return '';
    }
    
    try {
      final date = DateTime.parse(dateString);
      final formattedDate = "${date.year}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}";
      final formattedTime = "${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}";
      return "$formattedDate - $formattedTime";
    } catch (e) {
      // If parsing fails, return the original string
      return dateString;
    }
  }

  /// Format date from DateTime object to "2025/09/02"
  static String formatDateFromDateTime(DateTime? date) {
    if (date == null) {
      return '';
    }
    
    return "${date.year}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}";
  }

  /// Format date from DateTime object to "2025/09/02 - HH:MM"
  static String formatDateTimeFromDateTime(DateTime? date) {
    if (date == null) {
      return '';
    }
    
    final formattedDate = "${date.year}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}";
    final formattedTime = "${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}";
    return "$formattedDate - $formattedTime";
  }

  /// Format date for API calls (ISO 8601 format)
  static String formatDateForAPI(DateTime? date) {
    if (date == null) {
      return '';
    }
    
    return date.toIso8601String().split('T')[0];
  }

  /// Parse date string and return DateTime object
  static DateTime? parseDate(String? dateString) {
    if (dateString == null || dateString.isEmpty) {
      return null;
    }
    
    try {
      return DateTime.parse(dateString);
    } catch (e) {
      return null;
    }
  }

  /// Check if date string is valid
  static bool isValidDate(String? dateString) {
    if (dateString == null || dateString.isEmpty) {
      return false;
    }
    
    try {
      DateTime.parse(dateString);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Get relative time string (e.g., "2 hours ago", "3 days ago")
  static String getRelativeTime(String? dateString) {
    if (dateString == null || dateString.isEmpty) {
      return '';
    }
    
    try {
      final date = DateTime.parse(dateString);
      final now = DateTime.now();
      final difference = now.difference(date);
      
      if (difference.inDays > 0) {
        return "${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago";
      } else if (difference.inHours > 0) {
        return "${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago";
      } else if (difference.inMinutes > 0) {
        return "${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago";
      } else {
        return "Just now";
      }
    } catch (e) {
      return dateString;
    }
  }
}
