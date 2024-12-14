import 'package:flutter/material.dart';
import 'package:volleyapp/core/constants/colors.dart';

class ActionButton extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;
  final bool isLeft;

  const ActionButton({
    super.key,
    required this.name,
    required this.onPressed,
    this.isLeft = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Row(
        mainAxisAlignment:
            isLeft ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment:
            isLeft ? CrossAxisAlignment.center : CrossAxisAlignment.center,
        children: [
          if (isLeft) ...[
            Text(
              name,
              style: const TextStyle(
                fontSize: 24.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 10.0),
          ],
          InkWell(
            borderRadius: BorderRadius.circular(100.0),
            onTap: onPressed,
            child: Container(
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: AppColors.deepBlue,
                borderRadius: BorderRadius.circular(100.0),
              ),
              child: const Text(
                '+',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 30.0,
                  height: 0.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          if (!isLeft) ...[
            const SizedBox(width: 10.0),
            Text(
              name,
              style: const TextStyle(
                fontSize: 24.0,
                color: Colors.white,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
