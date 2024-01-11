import 'package:flutter/foundation.dart';
import 'package:hangar_gym/backend/db_helper.dart';
import 'package:hangar_gym/data/classes_info.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sqflite/sqflite.dart';

class DbClasses {
  final DbHelper dbHelper = DbHelper();

  Future<List<Map<String, dynamic>>> getClasses() async {
    Database db = await dbHelper.database;
    return await db.query('classes');
  }

  Future<void> insertClass() async {
    try {
      Database db = await dbHelper.database;

      await db.delete('classes');

      for (var oneClass in classesData) {
        await db.insert('classes', oneClass);
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error inserting classes: $e');
      }
    }
  }

  Future<List<Map<String, dynamic>>> getClassesFromApi() async {
    const apiUrl =
        'https://hangar-gym-server-side-git-main-abdenours-projects.vercel.app/classes.get';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);

        final List<Map<String, dynamic>> classData =
            jsonData.cast<Map<String, dynamic>>();
        print(classData);

        return classData;
      } else {
        throw Exception('Failed to load classes from API');
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching data from API: $error');
      }
      rethrow;
    }
  }
}
