import 'package:flutter/material.dart';
import 'package:volleyapp/core/constants/colors.dart';

class TeamsWinners extends StatelessWidget {
  final String team;
  final int victories;

  const TeamsWinners({super.key, required this.team, required this.victories});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            '$team:',
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 22,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            '$victories',
            style: const TextStyle(color: AppColors.deepBlue, fontSize: 22),
          ),
        ],
      ),
    );
  }
}
