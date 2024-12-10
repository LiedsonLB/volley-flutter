import 'package:volleyapp/core/data/database_service.dart';
import 'package:volleyapp/features/history/data/models/game_history.dart';

class ApiDatabase {
  final DatabaseService _databaseService = DatabaseService.instance;

  Future<List<GameSave>> fetchGameHistory() async {
    try {
      final gameHistoryData = await _databaseService.fetchGameHistory();
      return gameHistoryData;
    } catch (e) {
      throw Exception('Erro ao recuperar o histórico de jogos: $e');
    }
  }

  Future<int> saveGame(GameSave gameSave) async {
    try {
      final gameId = await _databaseService.saveGame(gameSave);
      print('Jogo salvo com sucesso! ID: $gameId');
      return gameId;
    } catch (e) {
      throw Exception('Erro ao salvar o jogo: $e');
    }
  }

  Future<void> saveSet(int gameId, Map<String, dynamic> set) async {
    print('Salvando set para o jogo ID $gameId');
    print('dados do set: $set');

    try {
      await _databaseService.saveSet(gameId, set);
      print('Set salvo com sucesso para o jogo ID $gameId');
    } catch (e) {
      throw Exception('Erro ao salvar o set: $e');
    }
  }
}
