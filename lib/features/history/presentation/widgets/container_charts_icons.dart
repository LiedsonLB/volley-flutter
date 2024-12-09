import 'package:flutter/material.dart';
import 'package:volleyapp/core/constants/colors.dart';

class ContainerChartsIcons extends StatelessWidget {
  const ContainerChartsIcons({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final horizontalPadding = screenWidth * 0.05;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(0),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            ),
          ),
          ...List.generate(
            4,
            (index) => const Icon(
              Icons.bar_chart_sharp,
              size: 25,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
