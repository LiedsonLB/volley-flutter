class GameSave {
  final int? id;
  final String winner;
  final String mode;
  final String team1Name;
  final String team2Name;
  final int team1Aces;
  final int team2Aces;
  final int team1Attacks;
  final int team2Attacks;
  final int team1Blocks;
  final int team2Blocks;
  final int team1Errors;
  final int team2Errors;
  final String gameTime;
  final String date;

  GameSave({
    this.id,
    required this.winner,
    required this.mode,
    required this.team1Name,
    required this.team2Name,
    required this.team1Aces,
    required this.team2Aces,
    required this.team1Attacks,
    required this.team2Attacks,
    required this.team1Blocks,
    required this.team2Blocks,
    required this.team1Errors,
    required this.team2Errors,
    required this.gameTime,
    required this.date,
  });

  factory GameSave.fromMap(Map<String, dynamic> map) {
    return GameSave(
      id: map['id'],
      winner: map['winner'],
      mode: map['mode'],
      team1Name: map['team1_name'],
      team2Name: map['team2_name'],
      team1Aces: map['team1_aces'],
      team2Aces: map['team2_aces'],
      team1Attacks: map['team1_attacks'],
      team2Attacks: map['team2_attacks'],
      team1Blocks: map['team1_blocks'],
      team2Blocks: map['team2_blocks'],
      team1Errors: map['team1_errors'],
      team2Errors: map['team2_errors'],
      gameTime: map['game_time'],
      date: map['date'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'winner': winner,
      'mode': mode,
      'team1_name': team1Name,
      'team2_name': team2Name,
      'team1_aces': team1Aces,
      'team2_aces': team2Aces,
      'team1_attacks': team1Attacks,
      'team2_attacks': team2Attacks,
      'team1_blocks': team1Blocks,
      'team2_blocks': team2Blocks,
      'team1_errors': team1Errors,
      'team2_errors': team2Errors,
      'game_time': gameTime,
      'date': date,
    };
  }
}
