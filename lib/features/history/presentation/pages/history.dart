import 'package:flutter/material.dart';
import 'package:volleyapp/core/constants/colors.dart';
import 'package:volleyapp/features/game/presentation/controllers/scoreboard_controller.dart';
import 'package:volleyapp/features/history/presentation/widgets/app_bar_history.dart';
import 'package:volleyapp/features/history/presentation/widgets/container_charts_icons.dart';
import 'package:volleyapp/features/history/presentation/widgets/container_sets.dart';
import 'package:volleyapp/features/history/presentation/widgets/container_time_sets.dart';
import 'package:volleyapp/features/history/presentation/widgets/footer_teams_victories.dart';
import 'package:volleyapp/features/history/presentation/widgets/teams_winners.dart';

class HistoryPage extends StatefulWidget {
  final String team1;
  final String team2;

  const HistoryPage({super.key, required this.team1, required this.team2});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late ScoreboardController scoreboardController;

  @override
  void initState() {
    super.initState();
    scoreboardController = ScoreboardController(
      team1: widget.team1,
      team2: widget.team2,
    );
    print(
        'scoreboardController.setsNotifier: ${scoreboardController.setsNotifier.value}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      appBar: const AppBarHistory(),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Row(
                children: [
                  const ContainerChartsIcons(),
                  Expanded(
                    child: ValueListenableBuilder<List<Map<String, int>>>(
                      valueListenable: scoreboardController.setsNotifier,
                      builder: (context, sets, child) {
                        print('History: ${sets.length}');
                        return Row(
                          children: [
                            Expanded(
                              child: ContainerSets(
                                lettter: 'A',
                                team: scoreboardController.team1,
                                isLeft: true,
                                setsNotifier: scoreboardController.setsNotifier,
                                color: scoreboardController
                                            .team1PointsNotifier.value >
                                        scoreboardController
                                            .team2PointsNotifier.value
                                    ? AppColors.lightRed
                                    : AppColors.deepBlue,
                              ),
                            ),
                            Expanded(
                              child: ContainerSets(
                                lettter: 'B',
                                team: scoreboardController.team2,
                                isLeft: false,
                                setsNotifier: scoreboardController.setsNotifier,
                                color: scoreboardController
                                            .team2PointsNotifier.value >
                                        scoreboardController
                                            .team1PointsNotifier.value
                                    ? AppColors.lightRed
                                    : AppColors.deepBlue,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  const ContainerTimeSets(),
                ],
              ),
            ),
          ),
          // ValueListenableBuilder<List<Map<String, int>>>(
          //   valueListenable: scoreboardController.teamsVictories,
          //   builder: (context, teams, child) {
          //     return FooterTeamsVictories(
          //       teams: teams.map((team) {
          //         final teamName = team.keys.first;
          //         final victories = team.values.first;
          //         return TeamsWinners(team: teamName, victories: victories);
          //       }).toList(),
          //     );
          //   },
          // ),
          
          // print("CANSEI DO NOTIFIER: ${scoreboardController.teamsVictories.value}");
          const FooterTeamsVictories(teams: [
            TeamsWinners(team: 'Ziraldos', victories: 10),
            TeamsWinners(team: 'Ziraldos', victories: 10),
            TeamsWinners(team: 'Ziraldos', victories: 10),
            TeamsWinners(team: 'Ziraldos', victories: 10),
            TeamsWinners(team: 'Ziraldos', victories: 10),
            TeamsWinners(team: 'Ziraldos', victories: 10),
            TeamsWinners(team: 'Ziraldos', victories: 10),
            TeamsWinners(team: 'Ziraldos', victories: 10),
            TeamsWinners(team: 'Ziraldos', victories: 10),
            TeamsWinners(team: 'Ziraldos', victories: 10),
            TeamsWinners(team: 'Ziraldos', victories: 10),
          ]),
        ],
      ),
    );
  }
}
