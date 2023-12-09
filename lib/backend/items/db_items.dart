import 'package:hangar_gym/backend/db_helper.dart';
import 'package:hangar_gym/data/store_items.dart';
import 'package:sqflite/sqflite.dart';

class DbItems {
  final DbHelper dbHelper = DbHelper();

  Future<List<Map<String, dynamic>>> getStoreItems() async {
    Database db = await dbHelper.database;
    return await db.query('store_items');
  }

  Future<void> insertStoreItems() async {
    try {
      Database db = await dbHelper.database;

      await db.delete('store_items');

      for (var item in storeItems) {
        await db.insert('store_items', item);
      }
    } catch (e) {
      print('Error inserting store items: $e');
    }
  }
}
