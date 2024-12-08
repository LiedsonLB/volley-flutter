class ScoreboardController {
  int team1Points = 0;
  int team2Points = 0;
  bool team1IsPlaying = true;

  void addPointToTeam(bool isTeam1) {
    if (isTeam1) {
      team1Points++;
    } else {
      team2Points++;
    }
  }

  void changeTeam() {
    team1IsPlaying = !team1IsPlaying;
  }

  void stop() {
    team1Points = 0;
    team2Points = 0;
    team1IsPlaying = true;
  }
}