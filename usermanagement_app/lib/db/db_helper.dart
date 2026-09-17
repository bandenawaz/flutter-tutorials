import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    //Initialize the database
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'user_details.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  //lets create the database tables for users and other data
  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
      '''
      CREATE TABLE IF NOT EXISTS user_details(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        fullname TEXT,
        email TEXT,
        password TEXT

      )
      ''',
    );
  }

  //lets write the query to insert the data into the table
  Future<int> insertUser(Map<String, dynamic> user) async {
    final db = await database;
    return await db.insert('user_details', user);
  }

  //lets write the query to to get all users
  Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await database;
    return await db.query('user_details');
  }

  //lets write the query to update the user details
  Future<int> updateUser(Map<String, dynamic> user, int id) async {
    final db = await database;
    print('Updating user with id: $id');
    print('Data to update: $user');
    return await db.update(
      'user_details',
      user,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  //Delete user
  Future<int> deleteUser(int id) async {
    final db = await database;
    return await db.delete('user_details', where: 'id = ?', whereArgs: [id]);
  }

  Future<bool> loginUser(String email, String password) async {
    final db = await database;
    final List<Map<String, dynamic>> users = await db.query(
      'user_details',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    return users.isNotEmpty;
  }
}
