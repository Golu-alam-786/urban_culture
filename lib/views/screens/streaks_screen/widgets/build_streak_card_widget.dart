import 'package:flutter/material.dart';
import '../../../utils/constants/app_colors.dart';

class BuildStreakCardWidget extends StatelessWidget {
  final int streakDays;

  const BuildStreakCardWidget({super.key, required this.streakDays});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: AppColors.containerColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Streak Days',
            style: TextStyle(
                fontSize: 16, color: AppColors.titleColor, fontWeight: FontWeight.w500),
          ),
          Text(
            streakDays.toString(),
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
