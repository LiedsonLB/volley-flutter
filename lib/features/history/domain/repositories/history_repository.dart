import 'package:volleyapp/features/history/data/models/game_history.dart';

abstract class HistoryRepository {
  Future<void> addHistory(GameSave gameSave);
  Future<List<GameSave>> getHistories();
}