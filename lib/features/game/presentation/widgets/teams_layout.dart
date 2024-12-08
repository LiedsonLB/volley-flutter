import 'package:flutter/material.dart';

import 'package:volleyapp/core/constants/colors.dart';

class TeamsLayout extends StatelessWidget {
  final String firstTeam;
  final String secondTeam;

  const TeamsLayout(
      {super.key, required this.firstTeam, required this.secondTeam});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Text(
                  'A',
                  style: TextStyle(
                      fontSize: 20,
                      color: AppColors.darkBlue,
                      height: 1.0),
                ),
              ),
            ),
            Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.15,
              ),
              child: Text(
                firstTeam,
                overflow: TextOverflow.ellipsis,
                style:
                const TextStyle(fontSize: 18, color: AppColors.darkBlue),
              ),
            )
          ],
        ),
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Text(
                  'B',
                  style: TextStyle(
                      fontSize: 20,
                      color: AppColors.darkBlue,
                      height: 1.0),
                ),
              ),
            ),
            Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.15,
              ),
              child: Text(
                secondTeam,
                overflow: TextOverflow.ellipsis,
                style:
                const TextStyle(fontSize: 18, color: AppColors.darkBlue),
              ),
            )
          ],
        )
      ],
    );
  }
}