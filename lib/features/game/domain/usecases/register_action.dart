import 'package:volleyapp/features/game/domain/repositories/game_repository.dart';
import 'package:volleyapp/features/game/presentation/controllers/scoreboard_controller.dart';

class RegisterAction {
  final GameRepository _gameRepository;

  RegisterAction(this._gameRepository);

  Future<void> call(String action, ScoreboardController scoreboardController, {required bool isTeam1}) async {
    return _gameRepository.registerAction(action, scoreboardController, isTeam1: isTeam1);
  }
}