import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:x_calcu/features/notification/data/notification_model.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';

class NotificationRepo {
  static Database? _database;
  static const String _tableName = 'notifications';

  /// Converts database row to NotificationModel
  NotificationModel _mapToNotification(Map<String, dynamic> data) {
    try {
      // Create a copy to avoid modifying the original data
      final Map<String, dynamic> convertedData = Map<String, dynamic>.from(
        data,
      );

      // Convert int back to bool and DateTime
      convertedData['isRead'] = (convertedData['isRead'] as int) == 1;
      convertedData['scheduledTime'] = DateTime.fromMillisecondsSinceEpoch(
        convertedData['scheduledTime'] as int,
      );
      convertedData['createdAt'] = DateTime.fromMillisecondsSinceEpoch(
        convertedData['createdAt'] as int,
      );

      // Create NotificationModel directly instead of using fromJson
      return NotificationModel(
        id: convertedData['id'] as int,
        title: convertedData['title'] as String,
        body: convertedData['body'] as String,
        scheduledTime: convertedData['scheduledTime'] as DateTime,
        createdAt: convertedData['createdAt'] as DateTime,
        type: NotificationType.values.firstWhere(
          (e) => e.name == convertedData['type'],
          orElse: () => NotificationType.input,
        ),
        operationId: convertedData['operationId'] as int,
        partnerName: convertedData['partnerName'] as String?,
        customerName: convertedData['customerName'] as String?,
        amount: convertedData['amount'] as double?,
        isRead: convertedData['isRead'] as bool,
        payload: convertedData['payload'] as String?,
      );
    } catch (e) {
      printError('Error mapping notification data: $e');
      printError('Data: $data');
      rethrow;
    }
  }

  /// Gets the database instance
  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  /// Initializes the database
  Future<Database> _initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'notifications.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  /// Creates the notifications table
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tableName (
        id INTEGER PRIMARY KEY,
        title TEXT NOT NULL,
        body TEXT NOT NULL,
        scheduledTime INTEGER NOT NULL,
        createdAt INTEGER NOT NULL,
        type TEXT NOT NULL,
        operationId INTEGER NOT NULL,
        partnerName TEXT,
        customerName TEXT,
        amount REAL,
        isRead INTEGER DEFAULT 0,
        payload TEXT
      )
    ''');
  }

  /// (step_3) Saves a notification to the database
  Future<void> saveNotification(NotificationModel notification) async {
    final db = await database;

    // Convert the notification to a map and handle bool to int conversion
    final Map<String, dynamic> data = notification.toJson();

    // Convert bool to int for SQLite compatibility
    data['isRead'] = notification.isRead ? 1 : 0;
    data['scheduledTime'] = notification.scheduledTime.millisecondsSinceEpoch;
    data['createdAt'] = notification.createdAt.millisecondsSinceEpoch;

    await db.insert(
      _tableName,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    // الحذف التلقائي بعد 15 عملية
    await _autoDeleteOldNotifications();
  }

  /// Gets all notifications
  Future<List<NotificationModel>> getAllNotifications() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      _tableName,
      orderBy: 'scheduledTime DESC',
    );

    return List.generate(maps.length, (i) {
      return _mapToNotification(maps[i]);
    });
  }

  /// Gets active notifications (only those that have reached their scheduled time)
  Future<List<NotificationModel>> getActiveNotifications() async {
    final db = await database;
    final now = DateTime.now().millisecondsSinceEpoch;

    final List<Map<String, dynamic>> maps = await db.query(
      _tableName,
      where: 'scheduledTime <= ?',
      whereArgs: [now],
      orderBy: 'scheduledTime DESC',
    );

    return List.generate(maps.length, (i) {
      return _mapToNotification(maps[i]);
    });
  }

  /// Gets all notifications including immediate ones
  Future<List<NotificationModel>>
  getAllNotificationsIncludingImmediate() async {
    try {
      final db = await database;
      // Get all notifications without time restrictions
      final List<Map<String, dynamic>> maps = await db.query(
        _tableName,
        orderBy: 'scheduledTime DESC',
      );

      return List.generate(maps.length, (i) {
        return _mapToNotification(maps[i]);
      });
    } catch (e) {
      printError('Error in getAllNotificationsIncludingImmediate: $e');
      rethrow;
    }
  }

  /// Gets notifications by type
  Future<List<NotificationModel>> getNotificationsByType(
    NotificationType type,
  ) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      _tableName,
      where: 'type = ?',
      whereArgs: [type.name],
      orderBy: 'scheduledTime DESC',
    );

    return List.generate(maps.length, (i) {
      return _mapToNotification(maps[i]);
    });
  }

  /// Gets unread notifications
  Future<List<NotificationModel>> getUnreadNotifications() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      _tableName,
      where: 'isRead = ?',
      whereArgs: [0],
      orderBy: 'scheduledTime DESC',
    );

    return List.generate(maps.length, (i) {
      return _mapToNotification(maps[i]);
    });
  }

  /// Marks a notification as read
  Future<void> markAsRead(int notificationId) async {
    final db = await database;
    await db.update(
      _tableName,
      {'isRead': 1},
      where: 'id = ?',
      whereArgs: [notificationId],
    );
  }

  /// Marks all notifications as read
  Future<void> markAllAsRead() async {
    final db = await database;
    await db.update(_tableName, {'isRead': 1});
  }

  /// Deletes a notification
  Future<void> deleteNotification(int notificationId) async {
    final db = await database;
    await db.delete(_tableName, where: 'id = ?', whereArgs: [notificationId]);
  }

  /// Deletes all notifications
  Future<void> deleteAllNotifications() async {
    final db = await database;
    await db.delete(_tableName);
  }

  /// Gets notification count
  Future<int> getNotificationCount() async {
    final db = await database;
    final result = await db.rawQuery(
      'SELECT COUNT(*) as count FROM $_tableName',
    );
    return Sqflite.firstIntValue(result) ?? 0;
  }

  /// Gets unread notification count
  Future<int> getUnreadNotificationCount() async {
    final db = await database;
    final result = await db.rawQuery(
      'SELECT COUNT(*) as count FROM $_tableName WHERE isRead = 0',
    );
    return Sqflite.firstIntValue(result) ?? 0;
  }

  /// Auto-deletes old notifications when count exceeds 15
  Future<void> _autoDeleteOldNotifications() async {
    final db = await database;

    // Count current notifications
    final countResult = await db.rawQuery(
      'SELECT COUNT(*) as count FROM $_tableName',
    );
    final currentCount = Sqflite.firstIntValue(countResult) ?? 0;

    // If more than 15, delete the oldest ones
    if (currentCount > 15) {
      final deleteCount = currentCount - 15;
      await db.rawDelete(
        '''
        DELETE FROM $_tableName 
        WHERE id IN (
          SELECT id FROM $_tableName 
          ORDER BY createdAt ASC 
          LIMIT ?
        )
      ''',
        [deleteCount],
      );

      printInfo('🗑️ Auto-deleted $deleteCount old notifications');
    }
  }

  /// Public method for auto-deleting old notifications
  Future<void> autoDeleteOldNotifications() async {
    await _autoDeleteOldNotifications();
  }

  /// Debug method to check database contents
  Future<void> debugDatabaseContents() async {
    try {
      final db = await database;
      final List<Map<String, dynamic>> maps = await db.query(_tableName);

      printInfo('🗄️ Database contents:');
      for (var map in maps) {
        printInfo(
          '  - ID: ${map['id']}, Title: ${map['title']}, Scheduled: ${map['scheduledTime']}',
        );
      }
      printInfo('🗄️ Total notifications in database: ${maps.length}');
    } catch (e) {
      printError('Error debugging database: $e');
    }
  }

  /// Reset database (for debugging)
  Future<void> resetDatabase() async {
    try {
      if (_database != null) {
        await _database!.close();
        _database = null;
      }

      final databasesPath = await getDatabasesPath();
      final path = join(databasesPath, 'notifications.db');

      // Delete the database file
      final file = File(path);
      if (await file.exists()) {
        await file.delete();
      }

      printInfo('🗄️ Database reset successfully');
    } catch (e) {
      printError('Error resetting database: $e');
    }
  }
}
