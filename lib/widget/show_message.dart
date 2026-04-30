import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stock_management_exam/values/app_colors.dart';
import 'package:stock_management_exam/values/app_text_style.dart';

class ShowMessage {
  final BuildContext context;
  final String? message;
  ShowMessage({required this.context, this.message});

  void show() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.greenColor,
        content: Text(message!, style: semiBoldTextStyle),
        dismissDirection: DismissDirection.startToEnd,
      ),
    );
  }
}
