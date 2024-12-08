import 'package:volleyapp/features/game/domain/repositories/game_repository.dart';

class RegisterAction {
  final GameRepository _gameRepository;

  RegisterAction(this._gameRepository);

  Future<void> call(String action, {required bool isTeam1}) async {
    return _gameRepository.registerAction(action, isTeam1: isTeam1);
  }
}