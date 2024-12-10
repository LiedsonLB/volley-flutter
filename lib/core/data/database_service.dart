import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:volleyapp/features/history/data/models/game_history.dart';

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
      version: 2, // Versão do banco, atualize se necessário
      onCreate: _createDB,
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          // Lógica de migração, se necessário
        }
      },
    );
  }

  Future<void> deleteDatabaseFile() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'sets_history.db');

    await deleteDatabase(path);

    print('Banco de dados excluído com sucesso');
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE IF NOT EXISTS game_history (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      date TEXT,
      winner TEXT,
      team1_name TEXT,
      team2_name TEXT,
      created_at TEXT DEFAULT CURRENT_TIMESTAMP
    )
    ''');

    await db.execute('''
    CREATE TABLE IF NOT EXISTS game_sets (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      game_id INTEGER,
      set_number INTEGER,
      game_time TEXT,
      team1_aces INTEGER,
      team2_aces INTEGER,
      team1_attacks INTEGER,
      team2_attacks INTEGER,
      team1_blocks INTEGER,
      team2_blocks INTEGER,
      team1_errors INTEGER,
      team2_errors INTEGER,
      created_at TEXT DEFAULT CURRENT_TIMESTAMP,
      FOREIGN KEY (game_id) REFERENCES game_history (id) ON DELETE CASCADE
    )
    ''');
  }

  // Método para salvar o jogo
  Future<int> saveGame(GameSave gameSave) async {
    final db = await database;

    // Salva a partida e retorna o ID
    final gameId = await db.insert('game_history', gameSave.toMap());

    // Salva cada set associado ao jogo
    for (int i = 0; i < gameSave.sets.length; i++) {
      final set = gameSave.sets[i];
      await db.insert('game_sets', set.toMap()..['game_id'] = gameId);
    }

    return gameId;
  }

  Future<void> saveSet(int gameId, Map<String, dynamic> set) async {
    // Validação dos dados do set
    if (set['game_time'] == null || set['team1_aces'] == null) {
      throw Exception('Dados incompletos para o set');
    }

    final db = await database;

    // Verifique se a tabela game_sets existe
    var tableExists = await db.rawQuery(
        "SELECT name FROM sqlite_master WHERE type='table' AND name='game_sets';");

    if (tableExists.isEmpty) {
      throw Exception('Tabela game_sets não existe no banco de dados.');
    }

    // Verifica quantos sets já existem para o jogo
    final currentSets = await db.query(
      'game_sets',
      where: 'game_id = ?',
      whereArgs: [gameId],
    );

    final setNumber = currentSets.length + 1;

    await db.insert('game_sets', {
      'game_id': gameId,
      'set_number': setNumber,
      'game_time': set['game_time'],
      'team1_aces': set['team1_aces'],
      'team2_aces': set['team2_aces'],
      'team1_attacks': set['team1_attacks'],
      'team2_attacks': set['team2_attacks'],
      'team1_blocks': set['team1_blocks'],
      'team2_blocks': set['team2_blocks'],
      'team1_errors': set['team1_errors'],
      'team2_errors': set['team2_errors'],
    });

    print('Set salvo com sucesso para o jogo ID $gameId');
  }

  Future<List<GameSave>> fetchGameHistory() async {
    final db = await database;

    final gameMaps = await db.query('game_history', orderBy: 'date DESC');

    List<GameSave> games = [];
    for (var gameMap in gameMaps) {
      final setMaps = await db.query(
        'game_sets',
        where: 'game_id = ?',
        whereArgs: [gameMap['id']],
        orderBy: 'set_number ASC',
      );

      games.add(GameSave.fromMap(gameMap, setMaps));
    }

    return games;
  }

  Future<void> close() async {
    final db = await database;
    db.close();
    _database = null;
  }
}
