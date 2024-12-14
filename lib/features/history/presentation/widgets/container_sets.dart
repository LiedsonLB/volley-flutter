import 'package:flutter/material.dart';
import 'package:volleyapp/core/constants/colors.dart';

class ContainerSets extends StatelessWidget {
  final String team;
  final bool isLeft;
  final String lettter;
  final Color color;
  final ValueNotifier<List<Map<String, int>>> setsNotifier;

  const ContainerSets({
    super.key,
    required this.team,
    this.isLeft = true,
    required this.lettter,
    required this.color,
    required this.setsNotifier,
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
        child: ValueListenableBuilder<List<Map<String, int>>>(
          valueListenable: setsNotifier,
          builder: (context, sets, child) {
            print(sets);
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(
                      lettter,
                      style: const TextStyle(
                        fontSize: 20,
                        color: AppColors.darkBlue,
                        height: 1.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ...sets.map((set) {
                  final points = set[team] ?? 0;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (isLeft) ...[
                        Text(
                          team,
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 22,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Text(
                          '$points',
                          style: TextStyle(
                            color: color,
                            fontSize: 22,
                          ),
                        ),
                      ] else ...[
                        Text(
                          '$points',
                          style: TextStyle(
                            color: color,
                            fontSize: 22,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Text(
                          team,
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ],
                  );
                }),
              ],
            );
          },
        ),
      ),
    );
  }
}
