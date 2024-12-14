import 'package:flutter/material.dart';
import 'package:volleyapp/core/constants/colors.dart';
import 'package:volleyapp/features/history/presentation/widgets/teams_winners.dart';

class FooterTeamsVictories extends StatelessWidget {
  final List<TeamsWinners> teams;

  const FooterTeamsVictories({super.key, required this.teams});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 4),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white.withOpacity(0.3),
            border: Border.all(
              color: AppColors.white,
              width: 2.0,
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 20),
                Row(
                  children: teams,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
