import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  Future<Database> getDatabase() async {
    final path = join(await getDatabasesPath(), 'scania.db');
    return openDatabase(path, version: 1, onCreate: _onCreate);
  }

  _onCreate(Database db, int version) async {
    await db.execute(_caminhao);
  }

  String get _caminhao => '''
    CREATE TABLE IF NOT EXISTS caminhao (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      tipoCaminhao INTEGER,
      valor REAL,
      modelo TEXT,
      ano INTEGER, 
      capacidadeCarga REAL
    );
  ''';

}