import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stock_management_exam/values/app_colors.dart';
import 'package:stock_management_exam/values/app_icon.dart';
import 'package:stock_management_exam/values/app_text_style.dart';
import 'package:stock_management_exam/values/screen_data.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool? showTitle;
  final String? title;
  final bool? centerTitle;
  final bool? showLeading;
  final Widget? leading;
  final List<Widget>? action;
  const CustomAppBar({super.key, this.showTitle, this.title, this.centerTitle, this.showLeading, this.leading, this.action});

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    var screenData = ScreenData(context: context);
    var screenWidth = screenData.screenWidth;
    return AppBar(
      title: showTitle == true ? Text(title!) : Text(""),
      titleTextStyle: semiBoldTextStyle.copyWith(color: AppColors.whiteColor, fontSize: 18),
      centerTitle: centerTitle,
      backgroundColor: AppColors.blackColor,
      leading: showLeading == true
          ? IconButton(
              onPressed: () {
                context.router.pop();
              },
              style: IconButton.styleFrom(foregroundColor: AppColors.whiteColor),
              icon: Icon(AppIcon.backArrowIcon),
            )
          : leading,
      actions: action,
      actionsPadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
    );
  }
}
