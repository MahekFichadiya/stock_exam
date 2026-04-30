import 'package:flutter/material.dart';
import 'package:stock_management_exam/values/screen_data.dart';

import '../../../generated/assets.dart';
import '../../../generated/l10n.dart';
import '../../../values/app_colors.dart';
import '../../../values/app_icon.dart';
import '../../../values/app_text_style.dart';
import '../../../values/dimension.dart';

class BottomUiBuySellScreen extends StatelessWidget {
  final ValueNotifier isSell;
  const BottomUiBuySellScreen({super.key, required this.isSell});

  @override
  Widget build(BuildContext context) {
    var screenData = ScreenData(context: context);
    var screenWidth = screenData.screenWidth;
    var screenHeight = screenData.screeHeight;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                spacing: screenWidth * 0.02,
                children: [
                  Text(
                    "${S.of(context).placingOrder}\n"
                    "${S.of(context).on}",
                    style: mediumTextStyle.copyWith(color: AppColors.blackGradientColor, fontSize: 12),
                  ),
                  Assets.images.appIconImage.image(),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                spacing: screenHeight * 0.01,
                children: [
                  Row(
                    spacing: screenWidth * 0.01,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(S.of(context).potentialProfit, style: semiBoldTextStyle.copyWith(color: AppColors.whiteColor, fontSize: 14)),
                      Icon(AppIcon.errorIcon, color: AppColors.whiteColor, size: screenHeight * 0.025),
                    ],
                  ),

                  Text(S.of(context).free, style: semiBoldTextStyle.copyWith(color: AppColors.greenColor, fontSize: 14)),
                ],
              ),
            ),
          ],
        ),
        ValueListenableBuilder(
          valueListenable: isSell,
          builder: (context, value, child) {
            return Container(
              margin: EdgeInsets.all(screenWidth * 0.05),
              padding: EdgeInsets.all(screenWidth * 0.05),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kBorderRadius),
                border: Border.all(color: value ? AppColors.redGradientColor : AppColors.greenColor, width: 2),
                gradient: LinearGradient(
                  colors: value ? [AppColors.redColor, AppColors.redColor.withAlpha(160)] : [AppColors.greenColor, AppColors.darkGreenGradientColor],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: screenWidth * 0.02,
                children: [
                  Icon(AppIcon.electricityIcon, color: AppColors.whiteColor),
                  Text(value ? S.of(context).instantSell : S.of(context).instantBuy, style: semiBoldTextStyle.copyWith(color: AppColors.whiteColor)),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
