import 'package:volleyapp/core/data/mock_teams.dart';
import 'package:volleyapp/features/home/data/models/team_data_model.dart';

class ApiClient {
  static List<TeamData> fetchTeams() {
    return mockTeams;
  }
}