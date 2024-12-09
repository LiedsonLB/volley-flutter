import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static final DatabaseService instance = DatabaseService._init();
  static Database? _database;

  DatabaseService._init();

  Future<Database> get database async {
    _database ??= await _initDB('sets_history.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE game_history (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      winner TEXT,
      team1_name TEXT,
      team2_name TEXT,
      team1_aces INTEGER,
      team2_aces INTEGER,
      team1_attacks INTEGER,
      team2_attacks INTEGER,
      team1_blocks INTEGER,
      team2_blocks INTEGER,
      team1_errors INTEGER,
      team2_errors INTEGER,
      game_time TEXT,
      date TEXT
    )
  ''');
  }

  Future<void> saveGame({
    required String winner,
    required String team1Name,
    required String team2Name,
    required int team1Aces,
    required int team2Aces,
    required int team1Attacks,
    required int team2Attacks,
    required int team1Blocks,
    required int team2Blocks,
    required int team1Errors,
    required int team2Errors,
    required String gameTime,
    required String date,
  }) async {
    final db = await instance.database;

    final data = {
      'winner': winner,
      'team1_name': team1Name,
      'team2_name': team2Name,
      'team1_aces': team1Aces,
      'team2_aces': team2Aces,
      'team1_attacks': team1Attacks,
      'team2_attacks': team2Attacks,
      'team1_blocks': team1Blocks,
      'team2_blocks': team2Blocks,
      'team1_errors': team1Errors,
      'team2_errors': team2Errors,
      'game_time': gameTime,
      'date': date,
    };

    await db.insert('game_history', data);
    print('Jogo salvo com sucesso');
  }

  Future<List<Map<String, dynamic>>> fetchGameHistory() async {
    final db = await instance.database;
    return await db.query('game_history', orderBy: 'date DESC');
  }

  Future<void> close() async {
    final db = await instance.database;
    db.close();
    _database = null;
  }
}
