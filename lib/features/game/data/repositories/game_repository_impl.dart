import 'package:volleyapp/features/game/domain/repositories/game_repository.dart';
import 'package:volleyapp/features/game/presentation/controllers/scoreboard_controller.dart';

class GameRepositoryImpl implements GameRepository {
  final ScoreboardController scoreboardController;

  GameRepositoryImpl(this.scoreboardController);

  @override
  Future<void> registerAction(String action, {required bool isTeam1}) async {
    switch (action) {
      case 'Ace':
        scoreboardController.addPointToTeam(isTeam1);
        break;
      case 'Attack':
        scoreboardController.addPointToTeam(isTeam1);
        break;
      case 'Block':
        scoreboardController.addPointToTeam(isTeam1);
        break;
      case 'Error':
        scoreboardController.addPointToTeam(!isTeam1);
        break;
      default:
        throw Exception('Ação inválida: $action');
    }

    scoreboardController.changeTeam();
  }
}