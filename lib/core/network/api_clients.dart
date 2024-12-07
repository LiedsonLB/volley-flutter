import 'package:volleyapp/core/data/team_data.dart';
import 'package:volleyapp/features/home/data/models/team_data_model.dart';

class ApiClients {
  static List<TeamData> getTeams() {
    return teams;
  }
}