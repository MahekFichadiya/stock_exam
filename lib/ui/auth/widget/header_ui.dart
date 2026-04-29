import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../../values/app_colors.dart';
import '../../../values/app_text_style.dart';
import '../../../values/screen_data.dart';

class HeaderUi extends StatelessWidget {
  final bool isLogin;
  const HeaderUi({super.key, required this.isLogin});

  @override
  Widget build(BuildContext context) {
    var screenData = ScreenData(context: context);
    var screenHeight = screenData.screeHeight;
    var screeWidth = screenData.screenWidth;
    return Container(
      height: screenHeight * 0.2,
      padding: EdgeInsets.symmetric(horizontal: screeWidth * 0.05, vertical: screenHeight * 0.02),
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(color: AppColors.blackColor),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: screeWidth * 0.08,
        children: [
          Container(
            height: screenHeight * 0.1,
            width: screeWidth * 0.02,
            decoration: BoxDecoration(color: AppColors.greenColor),
          ),
          Text(
            isLogin ? S.of(context).hello : S.of(context).createAccount,
            style: semiBoldTextStyle.copyWith(color: AppColors.greenColor, fontSize: 22),
          ),
        ],
      ),
    );
  }
}
