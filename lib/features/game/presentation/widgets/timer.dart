import 'package:flutter/material.dart';

class TimerLayout extends StatelessWidget {
  final String time;

  const TimerLayout({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Row(
              children: [
                Text(
                  'Tempo de Jogo: $time',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
