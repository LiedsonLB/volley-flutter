import 'package:flutter/material.dart';

import 'package:volleyapp/core/constants/colors.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            height: 42,
            image: Image.asset('assets/images/ball.png').image,
          ),
          const SizedBox(
            width: 15.0,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Volley',
                style: TextStyle(
                  fontSize: 40,
                  height: 0.8,
                  fontFamily: 'ConcertOne',
                  color: AppColors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 24.0),
                child: Text(
                  'do fim de semana',
                  style: TextStyle(
                    fontSize: 9,
                    fontFamily: 'ConcertOne',
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}