import 'package:flutter/material.dart';
import 'package:volleyapp/core/constants/colors.dart';
import 'package:volleyapp/features/game/presentation/widgets/button_modal_set_end.dart';
import 'package:volleyapp/features/home/presentation/pages/home.dart';

class ModalFinishGame {
  static void show(BuildContext context, String winner,
      {required Function onConfirm}) {
    void newGame() {
      Navigator.of(context).pop();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.white.withOpacity(0.8),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('FIM DE JOGO',
                      style: TextStyle(fontSize: 30, color: AppColors.deepBlue))
                ],
              ),
              const SizedBox(height: 10),
              Text(winner,
                  style:
                      const TextStyle(fontSize: 60, color: AppColors.deepBlue)),
              const SizedBox(height: 5),
              const Text('GANHOU',
                  style: TextStyle(fontSize: 20, color: AppColors.deepBlue)),
              const SizedBox(height: 20),
            ],
          ),
          actions: <Widget>[
            Container(
              constraints: const BoxConstraints(minWidth: 500),
              child: ButtonModalSetEnd(
                onPressed: newGame,
                text: 'Terminar',
                color: AppColors.white,
              ),
            ),
          ],
        );
      },
    );
  }
}
