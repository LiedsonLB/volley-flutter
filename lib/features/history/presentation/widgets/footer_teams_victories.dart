import 'package:flutter/material.dart';
import 'package:volleyapp/core/constants/colors.dart';

class FooterTeamsVictories extends StatelessWidget {
  const FooterTeamsVictories({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 4),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white.withOpacity(0.3),
          border: Border.all(
            color: AppColors.white,
            width: 2.0,
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Ziraldos:',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    ' 3',
                    style: TextStyle(color: AppColors.deepBlue, fontSize: 22),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
