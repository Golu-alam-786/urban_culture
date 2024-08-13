import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../utils/constants/app_colors.dart';
import 'image_display.dart';

class RoutineListTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final String imageUrl;
  final DateTime time;
  final bool isChecked;
  final bool loading;
  final ValueChanged<bool?> onCheckboxChanged;
  final VoidCallback onImageTap;

  const RoutineListTile({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.imageUrl,
    required this.time,
    required this.isChecked,
    required this.loading,
    required this.onCheckboxChanged,
    required this.onImageTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: AppColors.titleColor, fontSize: 16, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        subTitle,
        style: TextStyle(color: AppColors.subTitleColor, fontWeight: FontWeight.w400, fontSize: 14),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ImageDisplay(imageUrl: imageUrl, loading: loading, onTap: onImageTap),
          const SizedBox(width: 8.0),
          Text(
            DateFormat('hh:mm a').format(time),
            style: TextStyle(color: AppColors.subTitleColor),
          ),
        ],
      ),
      leading: Checkbox(
        value: isChecked,
        onChanged: onCheckboxChanged,
        checkColor: Colors.white,
        activeColor: Colors.pink,
      ),
    );
  }
}
