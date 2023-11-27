import 'package:conserta_ja/models/user.dart';
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
    String path = join(await getDatabasesPath(), 'dbtesteendereco.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE $tableName (
            id INTEGER PRIMARY KEY,
            email TEXT,
            phone TEXT,
            password TEXT,
            name TEXT,
            birthday TEXT,
            isClient TINYINT,
            profileImage TEXT,
            cep TEXT,
            street TEXT,
            block TEXT,
            district TEXT,
            city TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertUser(User user) async {
    final Database db = await database;

    try {
      await db.insert(tableName, {
        'email': user.email,
        'phone': user.phone,
        'password': user.password,
        'name': user.name,
        'birthday': user.birthday,
        'isClient': user.isClient,
        'profileImage': user.profileImage
      });
    } catch (e) {
      
    }
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    final Database db = await database;
    return await db.query(tableName);
  }

  Future<bool> isEmailAlreadyRegistered(String email) async {
    final Database db = await database;
    var result = await db.query(
      tableName,
      where: 'email = ?',
      whereArgs: [email],
    );
    return result.isNotEmpty;
  }

  Future<bool> isPhoneAlreadyRegistered(String phone) async {
    final Database db = await database;
    var result = await db.query(
      tableName,
      where: 'phone = ?',
      whereArgs: [phone],
    );
    return result.isNotEmpty;
  }

  Future<bool> loginUserEmail({String? email, String? password}) async {
    final Database db = await database;
    var result = await db.query(
      tableName,
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    return result.isNotEmpty;
  }

  Future<bool> loginUserPhone({String? phone, String? password}) async {
    final Database db = await database;
    var result = await db.query(
      tableName,
      where: 'phone = ? AND password = ?',
      whereArgs: [phone, password],
    );
    return result.isNotEmpty;
  }

  Future<void> updateUserAddress(String identifier, Map<String, dynamic> addressData) async {
    final Database db = await database;

    try {
      Map<String, dynamic>? existingUser = await getUserByIdentifier(identifier);

      if (existingUser != null) {
        Map<String, dynamic> updatedUser = {
          ...existingUser,
          ...addressData,
        };

        await db.update(
          tableName,
          updatedUser,
          where: 'email = ? OR phone = ?',
          whereArgs: [identifier, identifier],
        );
      }
    } catch (e) {

    }
  }

  Future<Map<String, dynamic>?> getUserByIdentifier(String identifier) async {
    final Database db = await database;
    List<Map<String, dynamic>> result = await db.query(
      tableName,
      where: 'email = ? OR phone = ?',
      whereArgs: [identifier, identifier],
    );

    return result.isNotEmpty ? result.first : null;
  }
}