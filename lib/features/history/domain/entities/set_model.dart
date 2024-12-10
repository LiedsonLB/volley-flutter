class SetModel {
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

  SetModel ({
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
  });
}