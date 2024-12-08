import 'package:flutter/material.dart';
import 'package:volleyapp/features/game/presentation/controllers/scoreboard_controller.dart';

class PointsLayout extends StatefulWidget {
  const PointsLayout({Key? key}) : super(key: key);

  @override
  State<PointsLayout> createState() => _PointsLayoutState();
}

class _PointsLayoutState extends State<PointsLayout> {
  late ScoreboardController scoreboardController;

  @override
  void initState() {
    super.initState();
    scoreboardController = ScoreboardController();
  }

  @override
  void dispose() {
    scoreboardController.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: scoreboardController.team1IsPlaying,
                        maintainSize: true,
                        maintainAnimation: true,
                        maintainState: true,
                        child: Image.asset(
                          'assets/images/ball.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
                      Text(
                        scoreboardController.team1Points.toString(),
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: !scoreboardController.team1IsPlaying,
                        maintainSize: true,
                        maintainAnimation: true,
                        maintainState: true,
                        child: Image.asset(
                          'assets/images/ball.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
                      Text(
                        scoreboardController.team2Points.toString(),
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
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