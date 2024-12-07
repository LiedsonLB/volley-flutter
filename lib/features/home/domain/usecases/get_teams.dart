import 'package:volleyapp/features/home/domain/entities/team.dart';
import 'package:volleyapp/features/home/domain/repositories/team_repository.dart';

class GetTeams {
  final TeamRepository repository;

  GetTeams(this.repository);

  Future<List<Team>> call() {
    return repository.getTeams();
  }
}