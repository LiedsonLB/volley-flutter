import 'package:flutter/material.dart';

class ScoreboardController {
  final String team1;
  final String team2;
  int _team1Points = 0;
  int _team2Points = 0;

  final ValueNotifier<int> team1PointsNotifier = ValueNotifier<int>(0);
  final ValueNotifier<int> team2PointsNotifier = ValueNotifier<int>(0);
  final ValueNotifier<bool> team1IsPlayingNotifier = ValueNotifier<bool>(true);

  ScoreboardController({required this.team1, required this.team2});

  void addPointTeam1(bool isTeam1) {
    if (isTeam1) {
      _team1Points++;
      team1PointsNotifier.value = _team1Points;
    } else {
      _team2Points++;
      team2PointsNotifier.value = _team2Points;
    }

    team1IsPlayingNotifier.value = isTeam1;

    verificWinner();
  }

  void stop() {
    _team1Points = 0;
    _team2Points = 0;
    team1PointsNotifier.value = _team1Points;
    team2PointsNotifier.value = _team2Points;
    team1IsPlayingNotifier.value = true;
  }

  void verificWinner() {
    if (_team1Points >= 25 && _team1Points - _team2Points >= 2) {
      // modal finish set and go to next set
      stop();
    } else if (_team2Points >= 25 && _team2Points - _team1Points >= 2) {
      // modal finish set and go to next set
      stop();
    }
  }
}
