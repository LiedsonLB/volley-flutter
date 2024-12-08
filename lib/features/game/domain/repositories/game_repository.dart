abstract class GameRepository {  
  Future<void> registerAction(String action, {required bool isTeam1});
}