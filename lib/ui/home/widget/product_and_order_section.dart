import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../values/app_colors.dart';
import '../../../values/app_icon.dart';
import '../../../values/app_text_style.dart';
import '../../../values/screen_data.dart';
import '../store/stock_store.dart';

class ProductSelection extends StatelessWidget {
  final String label;
  final List<String>? product;
  const ProductSelection({super.key, required this.label, this.product});

  @override
  Widget build(BuildContext context) {
    var screenData = ScreenData(context: context);
    var screenWidth = screenData.screenWidth;
    var screenHeight = screenData.screeHeight;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: screenWidth * 0.01,
          children: [
            Text(label, style: semiBoldTextStyle.copyWith(color: AppColors.whiteColor)),
            Icon(AppIcon.errorIcon, color: AppColors.whiteColor, size: screenHeight * 0.025),
          ],
        ),
        Observer(
          builder: (context) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              product!.length,
              (index) => Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: stockStore.selectedProductType.contains(product![index]),
                    onChanged: (value) {
                      stockStore.selectProduct(product![index]);
                    },
                    activeColor: AppColors.greenGradientColor.withAlpha(150),
                    checkColor: Colors.green,
                    side: BorderSide(color: AppColors.blackGradientColor),
                  ),
                  Text(product![index], style: mediumTextStyle.copyWith(color: AppColors.whiteColor, fontSize: 14)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class OrderSelection extends StatelessWidget {
  final String label;
  final List<String>? product;
  const OrderSelection({super.key, required this.label, this.product});

  @override
  Widget build(BuildContext context) {
    var screenData = ScreenData(context: context);
    var screenWidth = screenData.screenWidth;
    var screenHeight = screenData.screeHeight;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: screenWidth * 0.01,
          children: [
            Text(label, style: semiBoldTextStyle.copyWith(color: AppColors.whiteColor)),
            Icon(AppIcon.errorIcon, color: AppColors.whiteColor, size: screenHeight * 0.025),
          ],
        ),
        Observer(
          builder: (context) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              product!.length,
              (index) => Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: stockStore.selectedOrderType.contains(product![index]),
                    onChanged: (value) {
                      stockStore.selectOrder(product![index]);
                    },
                    activeColor: AppColors.greenGradientColor.withAlpha(150),
                    checkColor: Colors.green,
                    side: BorderSide(color: AppColors.blackGradientColor),
                  ),
                  Text(product![index], style: mediumTextStyle.copyWith(color: AppColors.whiteColor, fontSize: 14)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
