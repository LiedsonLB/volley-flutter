import 'package:flutter/material.dart';

import 'package:volleyapp/core/constants/colors.dart';

class AddTeamButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddTeamButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.0),
      ),
      foregroundColor: AppColors.white,
      backgroundColor: const Color.fromARGB(255, 6, 40, 104),
      onPressed: onPressed,
      tooltip: 'Adicionar time',
      child: const Center(
        child: Text(
          '+',
          style: TextStyle(
            fontFamily: 'ConcertOne',
            fontSize: 50,
            height: 0.5,
          ),
        ),
      ),
    );
  }
}