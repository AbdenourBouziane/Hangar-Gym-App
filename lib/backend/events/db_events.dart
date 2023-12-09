import 'package:hangar_gym/backend/db_helper.dart';
import 'package:hangar_gym/data/events_info.dart';
import 'package:sqflite/sqflite.dart';

class DbEvents {
  final DbHelper dbHelper = DbHelper();

  Future<List<Map<String, dynamic>>> getEvents() async {
    Database db = await dbHelper.database;
    return await db.query('events');
  }

  Future<void> insertEvents() async {
    try {
      Database db = await dbHelper.database;

      await db.delete('events');

      for (var event in eventData) {
        await db.insert('events', event);
      }
    } catch (e) {
      print('Error inserting events: $e');
    }
  }
}
