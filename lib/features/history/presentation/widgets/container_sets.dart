import 'package:flutter/material.dart';
import 'package:volleyapp/core/constants/colors.dart';

class ContainerSets extends StatelessWidget {
  final String team;
  final bool isLeft;

  const ContainerSets({
    super.key,
    required this.team,
    this.isLeft = true,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.lightRed,
          border: Border.all(
            color: AppColors.white,
            width: 2.0,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Text(
                  team,
                  style: const TextStyle(
                    fontSize: 20,
                    color: AppColors.darkBlue,
                    height: 1.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ...List.generate(
              4,
              (index) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (isLeft) ...[
                    const Text(
                      'Ziraldos',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      '0',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 18,
                      ),
                    ),
                  ] else ...[
                    const Text(
                      '0',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Ziraldos',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
