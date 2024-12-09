import 'package:volleyapp/features/game/presentation/controllers/scoreboard_controller.dart';

abstract class GameRepository {  
  Future<void> registerAction(String action, ScoreboardController scoreboardController, {required bool isTeam1});
}