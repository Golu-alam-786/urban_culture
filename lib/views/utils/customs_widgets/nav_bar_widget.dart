import 'package:flutter/material.dart';
import 'package:urban_culture/views/utils/constants/app_colors.dart';

class NavbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  List<Widget>? actions;
  Widget? leading;
  IconThemeData? iconTheme;
  bool automaticallyImplyLeading = true;
  bool? centerTitle;
  double? titleSpacing;
  TextStyle? titleTextStyle;
  Color? backgroundColor;

  NavbarWidget({super.key, required this.title,this.actions,this.leading,this.iconTheme,this.automaticallyImplyLeading = true,this.centerTitle,this.titleSpacing,this.titleTextStyle,this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      iconTheme: IconThemeData(color: Colors.white),
      automaticallyImplyLeading: automaticallyImplyLeading,
      title: Text(title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),),
      backgroundColor: AppColors.screenColor,
      actions: actions,
      centerTitle: true,
      titleSpacing: titleSpacing,
      titleTextStyle: titleTextStyle,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
