import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hangar_gym/backend/db_helper.dart';
import 'package:hangar_gym/data/coaches_info.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';

class DbCoaches {
  final DbHelper dbHelper = DbHelper();

  Future<List<Map<String, dynamic>>> getCoaches() async {
    Database db = await dbHelper.database;
    return await db.query('coaches');
  }

  Future<void> insertCoaches() async {
    try {
      Database db = await dbHelper.database;

      await db.delete('coaches');

      for (var coach in coachesData) {
        await db.insert('coaches', coach);
      }
    } catch (e) {
      if (kDebugMode) {
        print('Erro in inserting coaches : $e');
      }
    }
  }

  Future<List<Map<String, dynamic>>> getCoachesApi() async {
    const apiUrl =
        'https://hangar-gym-server-side-abdenours-projects.vercel.app/coaches.get';
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        print(response.body);

        final List<Map<String, dynamic>> coaches =
            jsonData.cast<Map<String, dynamic>>();

        return coaches;
      } else {
        throw Exception('Failed to load coin data: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching data from api : $e');
      }
      rethrow;
    }
  }
}
