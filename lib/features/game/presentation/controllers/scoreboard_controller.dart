import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:volleyapp/core/network/api_database.dart';
import 'package:volleyapp/features/history/data/models/game_history.dart';

class ScoreboardController {
  ApiDatabase apiDatabase = ApiDatabase();

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

  // Histórico de sets
  final List<Map<String, int>> _sets = [];

  // Notificadores para atualizar a UI
  final ValueNotifier<int> team1PointsNotifier = ValueNotifier<int>(0);
  final ValueNotifier<int> team2PointsNotifier = ValueNotifier<int>(0);
  final ValueNotifier<int> team1SetsNotifier = ValueNotifier<int>(0);
  final ValueNotifier<int> team2SetsNotifier = ValueNotifier<int>(0);
  final ValueNotifier<bool> team1IsPlayingNotifier = ValueNotifier<bool>(true);

  // Notificadores para estatísticas
  final ValueNotifier<int> team1AcesNotifier = ValueNotifier<int>(0);
  final ValueNotifier<int> team2AcesNotifier = ValueNotifier<int>(0);

  final ValueNotifier<int> team1BlocksNotifier = ValueNotifier<int>(0);
  final ValueNotifier<int> team2BlocksNotifier = ValueNotifier<int>(0);

  final ValueNotifier<int> team1AttacksNotifier = ValueNotifier<int>(0);
  final ValueNotifier<int> team2AttacksNotifier = ValueNotifier<int>(0);

  final ValueNotifier<int> team1ErrorsNotifier = ValueNotifier<int>(0);
  final ValueNotifier<int> team2ErrorsNotifier = ValueNotifier<int>(0);

  ScoreboardController({required this.team1, required this.team2});

  Future<void> startNewGame() async {
    try {
      String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

      final gameSave = GameSave(
        date: formattedDate,
        winner: '',
        team1Name: 'Time A',
        team2Name: 'Time B',
        createdAt: DateTime.now().toIso8601String(),
        sets: [],
      );

      gameId = await apiDatabase.saveGame(gameSave);

      print('Jogo iniciado com ID: $gameId');

      // Agora você pode começar a adicionar sets a esse jogo.
    } catch (e) {
      print('Erro ao iniciar o jogo: $e');
    }
  }

  // Adiciona ponto
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

  // Registra Ace
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

  // Registra Bloqueio
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

  // Registra Ataque
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

  // Registra Erro
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

  // Verifica vencedor do set
  void verifySetWinner() {
    if (_team1Points >= 25 && _team1Points - _team2Points >= 2) {
      _team1Sets++;
      team1SetsNotifier.value = _team1Sets;
      _registerSet(team1Score: _team1Points, team2Score: _team2Points);
      apiDatabase.saveSet(gameId, {
        'game_time': DateTime.now().toIso8601String(),
        'set_number': _sets.length,
        'team1_aces': team1AcesNotifier.value,
        'team2_aces': team2AcesNotifier.value,
        'team1_attacks': team1AttacksNotifier.value,
        'team2_attacks': team2AttacksNotifier.value,
        'team1_blocks': team1BlocksNotifier.value,
        'team2_blocks': team2BlocksNotifier.value,
        'team1_errors': team1ErrorsNotifier.value,
        'team2_errors': team2ErrorsNotifier.value,
      });
      resetPoints();
      checkGameWinner();
      print('Set vencido por $team1');
    } else if (_team2Points >= 25 && _team2Points - _team1Points >= 2) {
      _team2Sets++;
      team2SetsNotifier.value = _team2Sets;
      _registerSet(team1Score: _team1Points, team2Score: _team2Points);
      resetPoints();
      checkGameWinner();
      print('Set vencido por $team2');
    }
  }

  // Verifica vencedor do jogo
  void checkGameWinner() {
    if (_team1Sets == 3) {
      _endGame(team1Wins: true);
    } else if (_team2Sets == 3) {
      _endGame(team1Wins: false);
    }
  }

  void _registerSet({required int team1Score, required int team2Score}) {
    _sets.add({'team1': team1Score, 'team2': team2Score});
    print('Set registrado: $_sets');
  }

  void resetPoints() {
    _team1Points = 0;
    _team2Points = 0;
    team1PointsNotifier.value = _team1Points;
    team2PointsNotifier.value = _team2Points;
    team1IsPlayingNotifier.value = true;
  }

  void _endGame({required bool team1Wins}) {
    print('Jogo Encerrado! ${team1Wins ? team1 : team2} venceu!');
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

    _sets.clear();

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
