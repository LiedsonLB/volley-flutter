import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:volleyapp/core/network/api_database.dart';
// import 'package:volleyapp/features/history/data/models/game_history.dart';

class ScoreboardController {
  // ApiDatabase apiDatabase = ApiDatabase();

  final String team1;
  final String team2;
  int gameId = 0;

  // Pontuação
  int _team1Points = 0;
  int _team2Points = 0;

  // Sets vencidos
  int _team1Sets = 0;
  int _team2Sets = 0;

  // Estatísticas
  int _team1Aces = 0;
  int _team2Aces = 0;

  int _team1Blocks = 0;
  int _team2Blocks = 0;

  int _team1Attacks = 0;
  int _team2Attacks = 0;

  int _team1Errors = 0;
  int _team2Errors = 0;

  int numSets = 0;

  final ValueNotifier<List<Map<String, int>>> setsNotifier =
      ValueNotifier<List<Map<String, int>>>([
    {"Ziraldos": 21, "Autoconvidados": 25},
    {"Ziraldos": 21, "Autoconvidados": 25},
    {"Ziraldos": 21, "Autoconvidados": 25},
    {"Ziraldos": 21, "Autoconvidados": 25},
    {"Ziraldos": 21, "Autoconvidados": 25}
  ]);

  final ValueNotifier<List<Map<String, int>>> teamsVictories =
      ValueNotifier<List<Map<String, int>>>([]);

  final ValueNotifier<int> team1PointsNotifier = ValueNotifier<int>(0);
  final ValueNotifier<int> team2PointsNotifier = ValueNotifier<int>(0);
  final ValueNotifier<int> team1SetsNotifier = ValueNotifier<int>(0);
  final ValueNotifier<int> team2SetsNotifier = ValueNotifier<int>(0);
  final ValueNotifier<bool> team1IsPlayingNotifier = ValueNotifier<bool>(true);

  final ValueNotifier<int> team1AcesNotifier = ValueNotifier<int>(0);
  final ValueNotifier<int> team2AcesNotifier = ValueNotifier<int>(0);

  final ValueNotifier<int> team1BlocksNotifier = ValueNotifier<int>(0);
  final ValueNotifier<int> team2BlocksNotifier = ValueNotifier<int>(0);

  final ValueNotifier<int> team1AttacksNotifier = ValueNotifier<int>(0);
  final ValueNotifier<int> team2AttacksNotifier = ValueNotifier<int>(0);

  final ValueNotifier<int> team1ErrorsNotifier = ValueNotifier<int>(0);
  final ValueNotifier<int> team2ErrorsNotifier = ValueNotifier<int>(0);

  final ValueNotifier<bool> isSetFinishedNotifier = ValueNotifier<bool>(false);
  final ValueNotifier<bool> isGameFinishedNotifier = ValueNotifier<bool>(false);

  final ValueNotifier<String> teamWinner = ValueNotifier<String>('');

  final ValueNotifier<int> currentSetNotifier = ValueNotifier<int>(1);

  ScoreboardController({required this.team1, required this.team2});

  // Future<void> startNewGame() async {
  //   try {
  //     String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  //     final gameSave = GameSave(
  //       date: formattedDate,
  //       winner: '',
  //       team1Name: 'Time A',
  //       team2Name: 'Time B',
  //       createdAt: DateTime.now().toIso8601String(),
  //       sets: [],
  //     );

  //     gameId = await apiDatabase.saveGame(gameSave);

  //     print('Jogo iniciado com ID: $gameId');

  //   } catch (e) {
  //     print('Erro ao iniciar o jogo: $e');
  //   }
  // }

  String getTeam1() {
    return team1;
  }

  String getTeam2() {
    return team2;
  }

  void addPointTeam1(bool isTeam1) {
    if (isTeam1) {
      _team1Points++;
      team1PointsNotifier.value = _team1Points;
    } else {
      _team2Points++;
      team2PointsNotifier.value = _team2Points;
    }

    team1IsPlayingNotifier.value = isTeam1;

    verifySetWinner();
  }

  void registerAce(bool isTeam1) {
    if (isTeam1) {
      _team1Aces++;
      team1AcesNotifier.value = _team1Aces;
    } else {
      _team2Aces++;
      team2AcesNotifier.value = _team2Aces;
    }
    addPointTeam1(isTeam1);
  }

  void registerBlock(bool isTeam1) {
    if (isTeam1) {
      _team1Blocks++;
      team1BlocksNotifier.value = _team1Blocks;
    } else {
      _team2Blocks++;
      team2BlocksNotifier.value = _team2Blocks;
    }
    addPointTeam1(isTeam1);
  }

  void registerAttack(bool isTeam1) {
    if (isTeam1) {
      _team1Attacks++;
      team1AttacksNotifier.value = _team1Attacks;
    } else {
      _team2Attacks++;
      team2AttacksNotifier.value = _team2Attacks;
    }
    addPointTeam1(isTeam1);
  }

  void registerError(bool isTeam1) {
    if (isTeam1) {
      _team2Errors++;
      team2ErrorsNotifier.value = _team2Errors;
    } else {
      _team1Errors++;
      team1ErrorsNotifier.value = _team1Errors;
    }
    addPointTeam1(!isTeam1);
  }

  void verifySetWinner() {
    if (_team1Points >= 25 && _team1Points - _team2Points >= 2) {
      teamWinner.value = team1;
      _team1Sets++;
      isSetFinishedNotifier.value = true;
      team1SetsNotifier.value = _team1Sets;
      _registerSet(_team1Points, _team2Points);
      checkGameWinner();
      resetPoints();
    } else if (_team2Points >= 25 && _team2Points - _team1Points >= 2) {
      teamWinner.value = team2;
      _team2Sets++;
      isSetFinishedNotifier.value = true;
      team2SetsNotifier.value = _team2Sets;
      _registerSet(_team1Points, _team2Points);
      checkGameWinner();
      resetPoints();
    }
  }

  void checkGameWinner() {
    if (_team1Sets == 3) {
      final team1Index = teamsVictories.value
          .indexWhere((element) => element.keys.first == team1);
      if (team1Index != -1) {
        final team1Victories = teamsVictories.value[team1Index][team1] ?? 0;
        teamsVictories.value[team1Index][team1] = team1Victories + 1;
      } else {
        teamsVictories.value = [
          ...teamsVictories.value,
          {team1: 1}
        ];
      }
      teamWinner.value = team1;
      isSetFinishedNotifier.value = false;
      isGameFinishedNotifier.value = true;
      _endGame(team1Wins: true);
      return;
    } else if (_team2Sets == 3) {
      final team2Index = teamsVictories.value
          .indexWhere((element) => element.keys.first == team2);
      if (team2Index != -1) {
        final team2Victories = teamsVictories.value[team2Index][team2] ?? 0;
        teamsVictories.value[team2Index][team2] = team2Victories + 1;
      } else {
        teamsVictories.value = [
          ...teamsVictories.value,
          {team2: 1}
        ];
      }
      teamWinner.value = team2;
      isSetFinishedNotifier.value = false;
      isGameFinishedNotifier.value = true;
      _endGame(team1Wins: false);
      return;
    }
  }

  void _registerSet(int team1Score, int team2Score) {
    final newSet = {team1: team1Score, team2: team2Score};
    setsNotifier.value = [...setsNotifier.value, newSet];
    print('Set registrado: ${setsNotifier.value}');
  }

  void resetPoints() {
    numSets++;
    currentSetNotifier.value = numSets + 1;
    _team1Points = 0;
    _team2Points = 0;
    team1PointsNotifier.value = _team1Points;
    team2PointsNotifier.value = _team2Points;
    team1IsPlayingNotifier.value = true;
  }

  void _endGame({required bool team1Wins}) {
    stop();
  }

  void stop() {
    _team1Points = 0;
    _team2Points = 0;
    _team1Sets = 0;
    _team2Sets = 0;

    _team1Aces = 0;
    _team2Aces = 0;

    _team1Blocks = 0;
    _team2Blocks = 0;

    _team1Attacks = 0;
    _team2Attacks = 0;

    _team1Errors = 0;
    _team2Errors = 0;

    teamWinner.value = '';

    numSets = 0;

    isGameFinishedNotifier.value = false;
    isSetFinishedNotifier.value = false;

    currentSetNotifier.value = 1;

    team1PointsNotifier.value = _team1Points;
    team2PointsNotifier.value = _team2Points;
    team1SetsNotifier.value = _team1Sets;
    team2SetsNotifier.value = _team2Sets;

    team1AcesNotifier.value = _team1Aces;
    team2AcesNotifier.value = _team2Aces;

    team1BlocksNotifier.value = _team1Blocks;
    team2BlocksNotifier.value = _team2Blocks;

    team1AttacksNotifier.value = _team1Attacks;
    team2AttacksNotifier.value = _team2Attacks;

    team1ErrorsNotifier.value = _team1Errors;
    team2ErrorsNotifier.value = _team2Errors;
  }
}
