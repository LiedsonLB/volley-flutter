class SetsGame {
  final int? id;
  final int gameId;
  final int setNumber;
  final String gameTime;
  final int team1Aces;
  final int team2Aces;
  final int team1Attacks;
  final int team2Attacks;
  final int team1Blocks;
  final int team2Blocks;
  final int team1Errors;
  final int team2Errors;
  final String createdAt;

  SetsGame({
    this.id,
    required this.gameId,
    required this.setNumber,
    required this.gameTime,
    required this.team1Aces,
    required this.team2Aces,
    required this.team1Attacks,
    required this.team2Attacks,
    required this.team1Blocks,
    required this.team2Blocks,
    required this.team1Errors,
    required this.team2Errors,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'game_id': gameId,
      'set_number': setNumber,
      'game_time': gameTime,
      'team1_aces': team1Aces,
      'team2_aces': team2Aces,
      'team1_attacks': team1Attacks,
      'team2_attacks': team2Attacks,
      'team1_blocks': team1Blocks,
      'team2_blocks': team2Blocks,
      'team1_errors': team1Errors,
      'team2_errors': team2Errors,
      'created_at': createdAt,
    };
  }

  static SetsGame fromMap(Map<String, dynamic> map) {
    return SetsGame(
      id: map['id'],
      gameId: map['game_id'],
      setNumber: map['set_number'],
      gameTime: map['game_time'],
      team1Aces: map['team1_aces'],
      team2Aces: map['team2_aces'],
      team1Attacks: map['team1_attacks'],
      team2Attacks: map['team2_attacks'],
      team1Blocks: map['team1_blocks'],
      team2Blocks: map['team2_blocks'],
      team1Errors: map['team1_errors'],
      team2Errors: map['team2_errors'],
      createdAt: map['created_at'],
    );
  }
}
