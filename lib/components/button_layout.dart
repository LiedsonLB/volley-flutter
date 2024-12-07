import 'package:flutter/material.dart';
import 'package:volleyapp/core/constants/colors.dart';

class ButtonLayout extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ButtonLayout({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              side: const BorderSide(
                color: AppColors.white,
                width: 2,
                style: BorderStyle.solid,
              ),
              backgroundColor: const Color.fromARGB(255, 6, 40, 104),
              foregroundColor: AppColors.white,
              padding:
                  const EdgeInsets.symmetric(horizontal: 70.0, vertical: 18.0),
            ),
            onPressed: onPressed,
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 24,
                fontFamily: 'ConcertOne',
              ),
            ),
          ),
        ),
      ],
    );
  }
}