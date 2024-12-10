import 'package:volleyapp/core/network/api_database.dart';
import 'package:volleyapp/features/history/data/models/game_history.dart';
import 'package:volleyapp/features/history/domain/repositories/history_repository.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  final ApiDatabase database;

  HistoryRepositoryImpl(this.database);

  @override
  Future<List<GameSave>> getHistories() async {
    return database.fetchGameHistory();
  }

  @override
  Future<int> addHistory(GameSave game) async {
    return database.saveGame(game);
  }
}