import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:volleyapp/core/constants/colors.dart';
import 'package:volleyapp/features/game/presentation/controllers/scoreboard_controller.dart';

import 'package:volleyapp/features/game/presentation/controllers/timer_controller.dart';
import 'package:volleyapp/features/game/presentation/widgets/action_button.dart';
import 'package:volleyapp/features/game/presentation/widgets/modals/modal_finish_game.dart';
import 'package:volleyapp/features/game/presentation/widgets/modals/modal_finish_set.dart';
import 'package:volleyapp/features/game/presentation/widgets/points_layout.dart';
import 'package:volleyapp/features/game/presentation/widgets/scoreboard_button.dart';
import 'package:volleyapp/features/game/presentation/widgets/teams_layout.dart';
import 'package:volleyapp/features/game/presentation/widgets/timer.dart';
import 'package:volleyapp/features/history/presentation/pages/history.dart';

class GamePage extends StatefulWidget {
  final String team1;
  final String team2;

  const GamePage({super.key, required this.team1, required this.team2});

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  TimerController timerController = TimerController();
  late ScoreboardController scoreboardController;

  @override
  void initState() {
    super.initState();

    scoreboardController = ScoreboardController(
      team1: widget.team1,
      team2: widget.team2,
    );

    void checkGameState() {
      if (scoreboardController.isGameFinishedNotifier.value) {
        ModalFinishGame.show(
          context,
          scoreboardController.teamWinner.value,
          onConfirm: () {
            scoreboardController.isGameFinishedNotifier.value = false;
          },
        );
      } else if (scoreboardController.isSetFinishedNotifier.value) {
        ModalFinishSet.show(
          context,
          scoreboardController.teamWinner.value,
          onConfirm: () {
            scoreboardController.isSetFinishedNotifier.value = false;
          },
        );
      }
    }

    scoreboardController.isGameFinishedNotifier.addListener(checkGameState);
    scoreboardController.isSetFinishedNotifier.addListener(checkGameState);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    timerController.startTimer();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
    timerController.stopTimer();
  }

  void _historyPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  HistoryPage(team1: widget.team1, team2: widget.team2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      appBar: AppBar(
        backgroundColor: AppColors.blue,
        foregroundColor: AppColors.white,
        centerTitle: true,
        title: ValueListenableBuilder<int>(
          valueListenable: scoreboardController.currentSetNotifier,
          builder: (context, currentSet, _) {
            return Text('SET $currentSet');
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
              size: 30.0,
            ),
            tooltip: 'Configurações',
            onPressed: () {
              AlertDialog(
                title: const Text('Configurações'),
                content: const Text('Em breve!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Fechar'),
                  ),
                ],
              );
            },
          ),
        ],
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      ActionButton(
                        name: 'Ace',
                        onPressed: () {
                          scoreboardController.addPointTeam1(true);
                        },
                        isLeft: false,
                      ),
                      ActionButton(
                        name: 'Ataque',
                        onPressed: () {
                          scoreboardController.addPointTeam1(true);
                        },
                        isLeft: false,
                      ),
                      ActionButton(
                        name: 'Bloqueio',
                        onPressed: () {
                          scoreboardController.addPointTeam1(true);
                        },
                        isLeft: false,
                      ),
                      ActionButton(
                        name: 'Erro',
                        onPressed: () {
                          scoreboardController.addPointTeam1(false);
                        },
                        isLeft: false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TeamsLayout(
                  firstTeam: widget.team1,
                  secondTeam: widget.team2,
                ),
                PointsLayout(
                  team1: widget.team1,
                  team2: widget.team2,
                  scoreboardController: scoreboardController,
                ),
                ValueListenableBuilder<String>(
                  valueListenable: timerController.time,
                  builder: (context, time, child) {
                    return TimerLayout(time: time);
                  },
                ),
                ScoreBoardButton(onPressed: _historyPage),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ActionButton(
                        name: 'Ace',
                        onPressed: () {
                          scoreboardController.addPointTeam1(false);
                        },
                        isLeft: true,
                      ),
                      ActionButton(
                        name: 'Ataque',
                        onPressed: () {
                          scoreboardController.addPointTeam1(false);
                        },
                        isLeft: true,
                      ),
                      ActionButton(
                        name: 'Bloqueio',
                        onPressed: () {
                          scoreboardController.addPointTeam1(false);
                        },
                        isLeft: true,
                      ),
                      ActionButton(
                        name: 'Erro',
                        onPressed: () {
                          scoreboardController.addPointTeam1(true);
                        },
                        isLeft: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
