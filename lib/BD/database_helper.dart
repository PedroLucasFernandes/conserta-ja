import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;
  final String tableName = 'users';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'app_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE $tableName (
            id INTEGER PRIMARY KEY,
            email TEXT,
            phone TEXT,
            password TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertUser({String? email, String? phone, String? password}) async {
    final Database db = await database;
    await db.insert(tableName, {'email': email, 'phone': phone, 'password': password});
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    final Database db = await database;
    return await db.query(tableName);
  }

  Future<bool> loginUser({String? email, String? phone, String? password}) async {
    final Database db = await database;
    var result = await db.query(
      tableName,
      where: 'email = ? OR phone = ? AND password = ?',
      whereArgs: [email, phone, password],
    );
    return result.isNotEmpty;
  }
}