import 'package:flutter/material.dart';
import 'package:volleyapp/core/constants/colors.dart';

class ButtonModalSetEnd extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;

  const ButtonModalSetEnd(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
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
          backgroundColor: AppColors.deepBlue,
          foregroundColor: color,
          padding: const EdgeInsets.symmetric(horizontal: 70.0, vertical: 18.0),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 24,
            height: 1,
            fontFamily: 'ConcertOne',
          ),
        ),
      ),
    );
  }
}
