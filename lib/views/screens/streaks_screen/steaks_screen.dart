import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urban_culture/views/utils/constants/app_colors.dart';
import 'package:urban_culture/views/screens/streaks_screen/widgets/build_daily_streak.dart';
import 'package:urban_culture/views/screens/streaks_screen/widgets/build_get_start_button_widget.dart';
import 'package:urban_culture/views/screens/streaks_screen/widgets/build_streak_card_widget.dart';
import 'package:urban_culture/views/screens/streaks_screen/widgets/graph_chart_widget.dart';
import '../../../controller/streak_controller.dart';
import '../../utils/customs_widgets/nav_bar_widget.dart';

class StreaksScreen extends StatelessWidget {
  const StreaksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final StreakController streakController = Get.put(StreakController());

    return Scaffold(
      backgroundColor: AppColors.screenColor,
      appBar: NavbarWidget(title: "Streaks"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: ListView(
            children: [
              const Text("Today's Goal: 3 streak days", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
              SizedBox(height: screenHeight * 0.02),
              Obx(()=> BuildStreakCardWidget(streakDays: streakController.streakDays.value)),
              SizedBox(height: screenHeight * 0.02),
              Obx(()=> BuildDailyStreak(dailyStreak: streakController.dailyStreak.value)),
              SizedBox(height: screenHeight * 0.02),
              GraphChartWidget(streakController: streakController),
              SizedBox(height: screenHeight * 0.02),
              const Text("Keep it up! You're on a roll.", style: TextStyle(fontSize: 16, color: AppColors.titleColor,fontWeight: FontWeight.w400),),
              const SizedBox(height: 20,),
              const BuildGetStartButtonWidget(),
              SizedBox(height: screenHeight * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
