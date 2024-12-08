import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:volleyapp/core/constants/colors.dart';

import 'package:volleyapp/features/game/presentation/controllers/timer_controller.dart';
import 'package:volleyapp/features/game/presentation/widgets/action_button.dart';
import 'package:volleyapp/features/game/presentation/widgets/points_layout.dart';
import 'package:volleyapp/features/game/presentation/widgets/scoreboard_button.dart';
import 'package:volleyapp/features/game/presentation/widgets/teams_layout.dart';
import 'package:volleyapp/features/game/presentation/widgets/timer.dart';
import 'package:volleyapp/features/home/presentation/pages/home.dart';

class GamePage extends StatefulWidget {
  final String team1;
  final String team2;

  const GamePage({super.key, required this.team1, required this.team2});

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  TimerController timerController = TimerController();

  @override
  void initState() {
    super.initState();
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

  void _overAllPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      appBar: AppBar(
        backgroundColor: AppColors.blue,
        foregroundColor: AppColors.white,
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
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      ActionButton(
                        name: 'Ace',
                        onPressed: () {},
                        isLeft: false,
                      ),
                      ActionButton(
                        name: 'Ataque',
                        onPressed: () {},
                        isLeft: false,
                      ),
                      ActionButton(
                        name: 'Bloqueio',
                        onPressed: () {},
                        isLeft: false,
                      ),
                      ActionButton(
                        name: 'Erro',
                        onPressed: () {},
                        isLeft: false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TeamsLayout(
                  firstTeam: widget.team1,
                  secondTeam: widget.team2,
                ),
                const PointsLayout(),
                ValueListenableBuilder<String>(
                  valueListenable: timerController.time,
                  builder: (context, time, child) {
                    return TimerLayout(time: time);
                  },
                ),
                ScoreBoardButton(onPressed: _overAllPage),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
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
                        onPressed: () {},
                      ),
                      ActionButton(
                        name: 'Ataque',
                        onPressed: () {},
                      ),
                      ActionButton(
                        name: 'Bloqueio',
                        onPressed: () {},
                      ),
                      ActionButton(
                        name: 'Erro',
                        onPressed: () {},
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
