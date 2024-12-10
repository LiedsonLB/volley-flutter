import 'package:volleyapp/features/history/data/models/sets_game.dart';

class GameSave {
  final int? id;
  final String date;
  final String winner;
  final String team1Name;
  final String team2Name;
  final String createdAt;
  final List<SetsGame> sets;

  GameSave({
    this.id,
    required this.date,
    required this.winner,
    required this.team1Name,
    required this.team2Name,
    required this.createdAt,
    required this.sets,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'winner': winner,
      'team1_name': team1Name,
      'team2_name': team2Name,
      'created_at': createdAt,
    };
  }

  static GameSave fromMap(Map<String, dynamic> map, List<Map<String, dynamic>> setMaps) {
    return GameSave(
      id: map['id'],
      date: map['date'],
      winner: map['winner'],
      team1Name: map['team1_name'],
      team2Name: map['team2_name'],
      createdAt: map['created_at'],
      sets: setMaps.map((setMap) => SetsGame.fromMap(setMap)).toList(),
    );
  }
}
