import 'package:flutter/material.dart';

import '../../../values/app_colors.dart';
import '../../../values/app_text_style.dart';
import '../../../values/dimention.dart';
import '../../../values/screen_data.dart';

class DurationTab extends StatelessWidget {
  final String durationTab;
  final String selectedDurationTab;
  const DurationTab({super.key, required this.durationTab, required this.selectedDurationTab});

  @override
  Widget build(BuildContext context) {
    var screenData = ScreenData(context: context);
    var screenWidth = screenData.screenWidth;
    var screenHeight = screenData.screeHeight;
    return Container(
      margin: EdgeInsets.all(screenWidth * 0.015),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kBorderRadius * 3),
        gradient: LinearGradient(
          colors: selectedDurationTab == durationTab
              ? [AppColors.blackColor, AppColors.blackColor]
              : [AppColors.whiteColor, AppColors.whiteColor.withAlpha(100)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(screenWidth * 0.002),
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kBorderRadius * 3),
          gradient: LinearGradient(
            colors: selectedDurationTab == durationTab
                ? [AppColors.greenColor, AppColors.greenColor]
                : [AppColors.blackGradientColor, AppColors.blackColor],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Text(
          durationTab,
          style: semiBoldTextStyle.copyWith(color: selectedDurationTab == durationTab ? AppColors.blackColor : AppColors.whiteColor, fontSize: 14),
        ),
      ),
    );
  }
}
