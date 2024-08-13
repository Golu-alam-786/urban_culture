import 'package:flutter/material.dart';
import '../../../utils/constants/app_colors.dart';

class BuildDailyStreak extends StatelessWidget {
  final int dailyStreak;

  const BuildDailyStreak({super.key, required this.dailyStreak});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Daily Streak',
            style: TextStyle(
                fontSize: 16, color: AppColors.titleColor, fontWeight: FontWeight.w500),
          ),
          Text(
            dailyStreak.toString(),
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: height * 0.02),
          const Row(
            children: [
              Text(
                'Last 30 Days ',
                style: TextStyle(
                    color: AppColors.subTitleColor, fontWeight: FontWeight.w500),
              ),
              Text(
                '• 100%',
                style: TextStyle(
                    color: AppColors.percentage, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
