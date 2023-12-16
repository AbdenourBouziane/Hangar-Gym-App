import 'package:flutter/foundation.dart';
import 'package:hangar_gym/backend/db_helper.dart';
import 'package:hangar_gym/data/events_info.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
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
      if (kDebugMode) {
        print('Error inserting events: $e');
      }
    }
  }

  Future<List<Map<String, dynamic>>> getEventsFromApi() async {
    const apiUrl = 'https://hangar-gym-server-side.vercel.app/events.get';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);

        final List<Map<String, dynamic>> eventData =
            jsonData.cast<Map<String, dynamic>>();

        return eventData;
      } else {
        throw Exception('Failed to load events from API');
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching data from API: $error');
      }
      rethrow;
    }
  }
}
