import 'package:flutter/material.dart';
import 'package:stock_management_exam/values/screen_data.dart';

import '../../../generated/l10n.dart';
import '../../../values/app_colors.dart';
import '../../../values/app_text_style.dart';

class BottomUi extends StatelessWidget {
  final bool isLogin;
  final VoidCallback onPressed;
  const BottomUi({super.key, required this.isLogin, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    var screenData = ScreenData(context: context);
    var screenWidth = screenData.screenWidth;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: screenWidth * 0.01,
      children: [
        Text(
          isLogin ? S.of(context).dontHaveAnAccount : "Already have an account?",
          style: mediumTextStyle.copyWith(fontSize: 15, color: AppColors.newGreyColor),
        ),
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(foregroundColor: AppColors.blackColor, textStyle: semiBoldTextStyle.copyWith(fontSize: 15)),
          child: Text(isLogin ? S.of(context).signUp : S.of(context).logIn),
        ),
      ],
    );
  }
}
