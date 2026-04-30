import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stock_management_exam/values/app_colors.dart';
import 'package:stock_management_exam/values/app_icon.dart';
import 'package:stock_management_exam/values/app_text_style.dart';
import 'package:stock_management_exam/values/screen_data.dart';

import '../generated/l10n.dart';

class ShowSuccess {
  final BuildContext context;
  final bool isError;
  final String? errorMessage;
  final String? successMessage;
  final VoidCallback? onSuccessCallBack;
  ShowSuccess({required this.context, this.errorMessage, required this.isError, this.onSuccessCallBack, this.successMessage});

  void show() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Icon(isError ? AppIcon.errorIcon : AppIcon.successIcon, size: ScreenData(context: context).screeHeight * 0.06),
        content: Text(
          isError ? errorMessage! : successMessage!,
          textAlign: TextAlign.center,
          style: semiBoldTextStyle.copyWith(fontSize: 22, color: AppColors.newGreyColor),
        ),
        actions: [
          TextButton(
            onPressed:
                onSuccessCallBack ??
                () {
                  context.router.pop();
                },
            style: TextButton.styleFrom(foregroundColor: AppColors.blackColor, textStyle: semiBoldTextStyle.copyWith(fontSize: 15)),
            child: Text(S.of(context).ok),
          ),
        ],
      ),
    );
  }
}
