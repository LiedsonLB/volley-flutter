import 'package:volleyapp/features/home/data/models/team_data_model.dart';
import 'package:volleyapp/features/home/domain/entities/team.dart';

abstract class TeamRepository {
  Future<void> addTeam(TeamData team);
  Future<List<Team>> getTeams();
}