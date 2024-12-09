import 'package:flutter/material.dart';
import 'package:volleyapp/features/game/presentation/controllers/scoreboard_controller.dart';

class PointsLayout extends StatefulWidget {
  final String team1;
  final String team2;
  final ScoreboardController scoreboardController;

  const PointsLayout({
    Key? key,
    required this.team1,
    required this.team2,
    required this.scoreboardController,
  }) : super(key: key);

  @override
  State<PointsLayout> createState() => _PointsLayoutState();
}

class _PointsLayoutState extends State<PointsLayout> {
  late ScoreboardController scoreboardController;

  @override
  void initState() {
    super.initState();
    scoreboardController = widget.scoreboardController;
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
                      ValueListenableBuilder<bool>(
                        valueListenable:
                            scoreboardController.team1IsPlayingNotifier,
                        builder: (context, isPlaying, child) {
                          return AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: Visibility(
                              key: ValueKey<bool>(isPlaying),
                              visible: isPlaying,
                              maintainSize: true,
                              maintainAnimation: true,
                              maintainState: true,
                              child: Image.asset(
                                'assets/images/ball.png',
                                key: ValueKey<bool>(isPlaying),
                                width: 30,
                                height: 30,
                              ),
                            ),
                          );
                        },
                      ),
                      ValueListenableBuilder<int>(
                        valueListenable:
                            scoreboardController.team1PointsNotifier,
                        builder: (context, points, child) {
                          return Text(
                            points.toString(),
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          );
                        },
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
                      ValueListenableBuilder<bool>(
                        valueListenable:
                            scoreboardController.team1IsPlayingNotifier,
                        builder: (context, isPlaying, child) {
                          return AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: Visibility(
                              key: ValueKey<bool>(isPlaying),
                              visible: !isPlaying,
                              maintainSize: true,
                              maintainAnimation: true,
                              maintainState: true,
                              child: Image.asset(
                                'assets/images/ball.png',
                                key: ValueKey<bool>(isPlaying),
                                width: 30,
                                height: 30,
                              ),
                            ),
                          );
                        },
                      ),
                      ValueListenableBuilder<int>(
                        valueListenable:
                            scoreboardController.team2PointsNotifier,
                        builder: (context, points, child) {
                          return Text(
                            points.toString(),
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          );
                        },
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
