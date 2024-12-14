import 'package:volleyapp/core/error/action_invalide_exception.dart';
import 'package:volleyapp/features/game/domain/repositories/game_repository.dart';
import 'package:volleyapp/features/game/presentation/controllers/scoreboard_controller.dart';

class GameRepositoryImpl implements GameRepository {
  @override
  Future<void> registerAction(
      String action, ScoreboardController scoreboardController,
      {required bool isTeam1}) async {
    switch (action) {
      case 'Ace':
        scoreboardController.registerAce(isTeam1);
        break;
      case 'Attack':
        scoreboardController.registerAttack(isTeam1);
        break;
      case 'Block':
        scoreboardController.registerBlock(isTeam1);
        break;
      case 'Error':
        scoreboardController.registerError(!isTeam1);
        break;
      default:
        throw ActionInvalideException('action invalide: $action');
    }
  }
}
