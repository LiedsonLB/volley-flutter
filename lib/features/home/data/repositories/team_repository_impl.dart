import 'package:volleyapp/core/network/api_clients.dart';
import 'package:volleyapp/features/home/data/models/team_data_model.dart';
import 'package:volleyapp/features/home/domain/entities/team.dart';
import 'package:volleyapp/features/home/domain/repositories/team_repository.dart';

class TeamRepositoryImpl implements TeamRepository {
  final List<TeamData> _teams = [];
  
  @override
  Future<void> addTeam(TeamData team) async {
    _teams.add(team);
  }

  @override
  Future<List<Team>> getTeams() async {
    final teamsData = ApiClient.fetchTeams();
    return teamsData.map((data) => Team(name: data.name, players: data.players)).toList();
  }
}