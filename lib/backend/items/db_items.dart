import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hangar_gym/backend/db_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:hangar_gym/data/store_items.dart';
import 'package:http/http.dart' as http;

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
      if (kDebugMode) {
        print('Error inserting store items: $e');
      }
    }
  }

  Future<List<Map<String, dynamic>>> getStoreItemsApi() async {
    const apiUrl =
        'https://hangar-gym-server-side-abdenours-projects.vercel.app/items.get';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);

        final List<Map<String, dynamic>> storeItemsData =
            jsonData.cast<Map<String, dynamic>>();
        return storeItemsData;
      } else {
        throw Exception('Failed to load Items from API');
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching data from API : $error');
      }
      rethrow;
    }
  }
}
