import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DefaultButton extends StatelessWidget {
  DefaultButton({super.key,required this.onTap,required this.text,this.alignment});
  void Function()? onTap;
  String text;
  AlignmentGeometry? alignment;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: Get.height/15,
        width: Get.width/2,
        alignment: alignment,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: Text(text)),
      ),
    );
  }
}
