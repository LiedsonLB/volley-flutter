import 'package:volleyapp/features/home/data/models/team_data_model.dart';
import 'package:volleyapp/features/home/domain/repositories/team_repository.dart';

class AddTeam {
  final TeamRepository _repository;

  AddTeam(this._repository);

  Future<void> call(String name, int players) async {
    if (name.isEmpty || players <= 0) {
      throw ArgumentError('Nome do time ou número de jogadores inválido.');
    }

    final team = TeamData(name: name, players: players);
    await _repository.addTeam(team);
  }
}