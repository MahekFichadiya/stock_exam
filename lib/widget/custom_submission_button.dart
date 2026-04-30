import 'package:flutter/material.dart';
import 'package:stock_management_exam/values/app_colors.dart';
import 'package:stock_management_exam/values/app_text_style.dart';
import 'package:stock_management_exam/values/dimension.dart';

import '../values/screen_data.dart';

class CustomSubmissionButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final BoxDecoration? decoration;
  final EdgeInsets? padding;
  final TextStyle? labelStyle;
  const CustomSubmissionButton({super.key, required this.label, required this.onPressed, this.decoration, this.padding, this.labelStyle});

  @override
  Widget build(BuildContext context) {
    var screenData = ScreenData(context: context);
    var screeWidth = screenData.screenWidth;
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: padding ?? EdgeInsets.all(screeWidth * 0.05),
        alignment: Alignment.center,
        decoration:
            decoration ??
            BoxDecoration(
              gradient: LinearGradient(colors: [AppColors.greenColor, AppColors.greenGradientColor], stops: [0.2, 1]),
              borderRadius: BorderRadius.circular(kBorderRadius),
            ),
        child: Text(label, style: labelStyle ?? mediumTextStyle.copyWith(fontSize: 15)),
      ),
    );
    // return ElevatedButton(
    //   onPressed: onPressed,
    //   style: ElevatedButton.styleFrom(
    //     foregroundColor: AppColors.blackColor,
    //     textStyle: mediumTextStyle.copyWith(fontSize: 15),
    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kBorderRadius)),
    //   ),
    //   child: Text(label),
    // );
  }
}
