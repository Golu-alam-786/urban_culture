import 'package:flutter/material.dart';
import 'package:urban_culture/views/utils/constants/app_colors.dart';

class  BuildGetStartButtonWidget extends StatelessWidget {
  const  BuildGetStartButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.containerColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          'Get Started',
          style: TextStyle(color: AppColors.titleColor, fontSize: 16),
        ),
      ),
    );
  }
}
