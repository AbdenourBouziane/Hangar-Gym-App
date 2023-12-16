import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper._internal();
  static Database? _database;

  factory DbHelper() {
    return _instance;
  }

  DbHelper._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'app_database.db');

    Database db =
        await openDatabase(path, version: 1, onCreate: (db, version) async {
      await _createEventsTable(db);
      await _createStoreItemsTable(db);
      await _createCoachesTable(db);
    });

    return db;
  }

  Future<void> _createEventsTable(Database db) async {
    await db.execute('''
      CREATE TABLE events(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        eventName TEXT,
        eventImage TEXT
      )
    ''');
  }

  Future<void> _createStoreItemsTable(Database db) async {
    await db.execute('''
      CREATE TABLE store_items(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        itemName TEXT,
        itemImage TEXT,
        itemPrice TEXT
      )
    ''');
  }

  Future<void> _createCoachesTable(Database db) async {
    await db.execute('''
      CREATE TABLE coaches(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        coachName TEXT,
        coachImage TEXT,
        coachProfession TEXT
      )
    ''');
  }
}
