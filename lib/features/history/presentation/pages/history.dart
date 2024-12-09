import 'package:flutter/material.dart';
import 'package:volleyapp/core/constants/colors.dart';
import 'package:volleyapp/features/history/presentation/widgets/app_bar_history.dart';
import 'package:volleyapp/features/history/presentation/widgets/container_charts_icons.dart';
import 'package:volleyapp/features/history/presentation/widgets/container_sets.dart';
import 'package:volleyapp/features/history/presentation/widgets/container_time_sets.dart';
import 'package:volleyapp/features/history/presentation/widgets/footer_teams_victories.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.blue,
      appBar: AppBarHistory(),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                ContainerChartsIcons(),
                ContainerSets(
                  team: 'A',
                  isLeft: true,
                ),
                ContainerSets(
                  team: 'B',
                  isLeft: false,
                ),
                ContainerTimeSets(),
              ],
            ),
          ),
          FooterTeamsVictories(),
        ],
      ),
    );
  }
}
