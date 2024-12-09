import 'package:volleyapp/core/data/database_service.dart';
import 'package:volleyapp/features/game/data/models/game_history.dart';

class ApiDatabase {
  Future<List<GameSave>> fetchGameHistory() async {
    List<Map<String, dynamic>> gameHistoryData = await DatabaseService.instance.fetchGameHistory();

    return List.generate(gameHistoryData.length, (i) {
      return GameSave.fromMap(gameHistoryData[i]);
    });
  }

  Future<void> saveGame(GameSave gameSave) async {
    await DatabaseService.instance.saveGame(
      winner: gameSave.winner,
      team1Name: gameSave.team1Name,
      team2Name: gameSave.team2Name,
      team1Aces: gameSave.team1Aces,
      team2Aces: gameSave.team2Aces,
      team1Attacks: gameSave.team1Attacks,
      team2Attacks: gameSave.team2Attacks,
      team1Blocks: gameSave.team1Blocks,
      team2Blocks: gameSave.team2Blocks,
      team1Errors: gameSave.team1Errors,
      team2Errors: gameSave.team2Errors,
      gameTime: gameSave.gameTime,
      date: gameSave.date,
    );
  }
}