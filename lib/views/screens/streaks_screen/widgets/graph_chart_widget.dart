

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urban_culture/controller/streak_controller.dart';
import '../../../utils/constants/app_colors.dart';

class GraphChartWidget extends StatelessWidget {
   StreakController streakController = StreakController();
   GraphChartWidget({super.key, required this.streakController});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    if (streakController.graphData.isEmpty) {
      return const Center(
        child: Text(
          'No data available',
          style: TextStyle(color: AppColors.subTitleColor, fontSize: 16),
        ),
      );
    }

    return Obx(()=> Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.2,
              child: LineChart(LineChartData(
                  gridData: const FlGridData(show: false),
                  titlesData: const FlTitlesData(show: false),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                        spots: streakController.graphData.value,
                        isCurved: true,
                        color: AppColors.subTitleColor,
                        barWidth: 3,
                        dotData: const FlDotData(show: false)
                    ),
                  ])),
            ),
            SizedBox(height: height * 0.03),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("1D", style: TextStyle(color: AppColors.subTitleColor, fontSize: 12,fontWeight: FontWeight.bold)),
                Text("1W", style: TextStyle(color: AppColors.subTitleColor, fontSize: 12,fontWeight: FontWeight.bold)),
                Text("1M", style: TextStyle(color: AppColors.subTitleColor, fontSize: 12,fontWeight: FontWeight.bold)),
                Text("3M", style: TextStyle(color: AppColors.subTitleColor, fontSize: 12,fontWeight: FontWeight.bold)),
                Text("1Y", style: TextStyle(color: AppColors.subTitleColor, fontSize: 12,fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
