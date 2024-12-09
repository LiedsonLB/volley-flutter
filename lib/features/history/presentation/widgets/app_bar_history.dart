import 'package:flutter/material.dart';
import 'package:volleyapp/core/constants/colors.dart';

class AppBarHistory extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHistory({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.blue,
      foregroundColor: AppColors.white,
      centerTitle: true,
      title: const Text('PLACAR GERAL',
          style: TextStyle(color: AppColors.deepBlue)),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.show_chart_sharp,
                  size: 25.0,
                ),
                onPressed: () {},
              ),
              Positioned(
                bottom: 6.0,
                child: Container(
                  width: 25.0,
                  height: 3.0,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
