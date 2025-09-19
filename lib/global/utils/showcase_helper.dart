import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

/// Helper class for managing ShowcaseView throughout the app
class ShowcaseHelper {
  static final GlobalKey _globalKey = GlobalKey(
    debugLabel: 'showcase_global_key',
  );
  static final List<GlobalKey> _showcaseKeys = [];
  static bool _initialized = false;

  /// Initialize showcase keys for different features
  static void initializeShowcaseKeys() {
    if (_initialized) return;

    _showcaseKeys.clear();

    // Add keys for different features
    _showcaseKeys.addAll([
      GlobalKey(debugLabel: 'home_search'), // Home screen search
      GlobalKey(debugLabel: 'home_filter_toggle'), // Home screen filter toggle
      GlobalKey(debugLabel: 'home_sort_button'), // Home screen sort button
      GlobalKey(
        debugLabel: 'partners_add_button',
      ), // Partners screen add button
      GlobalKey(
        debugLabel: 'operations_add_button',
      ), // Operations screen add button
      GlobalKey(debugLabel: 'notification_screen'), // Notification screen
      GlobalKey(debugLabel: 'settings_screen'), // Settings screen
    ]);

    _initialized = true;
  }

  /// Get a specific showcase key by index
  static GlobalKey getShowcaseKey(int index) {
    // Ensure keys are initialized
    if (!_initialized) {
      initializeShowcaseKeys();
    }

    if (index >= 0 && index < _showcaseKeys.length) {
      return _showcaseKeys[index];
    }
    // Return a unique key for invalid indices
    return GlobalKey(debugLabel: 'showcase_key_$index');
  }

  /// Get a unique showcase key for a specific widget
  static GlobalKey getUniqueShowcaseKey(String widgetName) {
    return GlobalKey(
      debugLabel:
          'showcase_${widgetName}_${DateTime.now().millisecondsSinceEpoch}',
    );
  }

  /// Get a unique showcase key with context information
  static GlobalKey getContextualShowcaseKey(String widgetName, String context) {
    return GlobalKey(
      debugLabel:
          'showcase_${widgetName}_${context}_${DateTime.now().millisecondsSinceEpoch}',
    );
  }

  /// Reset showcase keys (for debugging)
  static void resetShowcaseKeys() {
    _initialized = false;
    _showcaseKeys.clear();
  }

  /// Start the showcase sequence
  static void startShowcase(BuildContext context) {
    if (_showcaseKeys.isNotEmpty) {
      ShowCaseWidget.of(context).startShowCase(_showcaseKeys);
    }
  }

  /// Start showcase for a specific key
  static void startShowcaseForKey(BuildContext context, GlobalKey key) {
    ShowCaseWidget.of(context).startShowCase([key]);
  }

  /// Dismiss current showcase
  static void dismissShowcase(BuildContext context) {
    ShowCaseWidget.of(context).dismiss();
  }

  /// Check if showcase is currently active
  static bool isShowcaseActive(BuildContext context) {
    try {
      final state = ShowCaseWidget.of(context);
      return state.mounted;
    } catch (e) {
      return false;
    }
  }

  /// Get the global key for general use
  static GlobalKey get globalKey => _globalKey;

  /// Get all showcase keys
  static List<GlobalKey> get allKeys => List.from(_showcaseKeys);
}

/// Showcase keys indices for easy reference
class ShowcaseKeys {
  static const int homeSearch = 0;
  static const int homeFilterToggle = 1;
  static const int homeSortButton = 2;
  static const int partnersAddButton = 3;
  static const int operationsAddButton = 4;
  static const int notificationScreen = 5;
  static const int settingsScreen = 6;
}

/// Showcase data model
class ShowcaseData {
  final String title;
  final String description;
  final IconData? icon;
  final Color? color;

  const ShowcaseData({
    required this.title,
    required this.description,
    this.icon,
    this.color,
  });
}

/// Predefined showcase data for different features
class ShowcaseDataProvider {
  static const List<ShowcaseData> showcaseData = [
    ShowcaseData(
      title: 'البحث في العمليات',
      description: 'يمكنك البحث في جميع العمليات باستخدام هذا الحقل',
      icon: Icons.search,
      color: Colors.blue,
    ),
    ShowcaseData(
      title: 'تصفية العمليات',
      description: 'اضغط هنا للتبديل بين عمليات الدخل والخرج',
      icon: Icons.filter_list,
      color: Colors.green,
    ),
    ShowcaseData(
      title: 'ترتيب العمليات',
      description: 'اضغط هنا لترتيب العمليات حسب التاريخ أو المبلغ',
      icon: Icons.sort,
      color: Colors.orange,
    ),
    ShowcaseData(
      title: 'إضافة شريك جديد',
      description: 'اضغط هنا لإضافة شريك جديد إلى قائمتك',
      icon: Icons.person_add,
      color: Colors.purple,
    ),
    ShowcaseData(
      title: 'إضافة عملية جديدة',
      description: 'اضغط هنا لإضافة عملية مالية جديدة',
      icon: Icons.add_circle,
      color: Colors.red,
    ),
    ShowcaseData(
      title: 'الإشعارات',
      description: 'عرض جميع الإشعارات المتعلقة بعملياتك المالية',
      icon: Icons.notifications,
      color: Colors.teal,
    ),
    ShowcaseData(
      title: 'الإعدادات',
      description: 'إعدادات التطبيق والمعلومات الشخصية',
      icon: Icons.settings,
      color: Colors.grey,
    ),
  ];

  static ShowcaseData getData(int index) {
    if (index >= 0 && index < showcaseData.length) {
      return showcaseData[index];
    }
    return const ShowcaseData(
      title: 'ميزة جديدة',
      description: 'اكتشف هذه الميزة الجديدة',
    );
  }
}
