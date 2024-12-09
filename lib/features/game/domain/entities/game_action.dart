import 'package:volleyapp/features/game/presentation/controllers/scoreboard_controller.dart';

class GameAction {
  final String action;
  final ScoreboardController scoreboardController;

  GameAction({required this.action, required this.scoreboardController});
}
