import 'package:flutter/material.dart';
import 'package:stock_management_exam/data/model/response_model/stock_response_model/particular_signal.dart';

import '../../../generated/assets.dart';
import '../../../generated/l10n.dart';
import '../../../values/app_colors.dart';
import '../../../values/app_icon.dart';
import '../../../values/app_text_style.dart';
import '../../../values/dimension.dart';
import '../../../values/screen_data.dart';
import '../../../widget/custom_submission_button.dart';

class CompanyDetail extends StatelessWidget {
  final Signal stockDetail;
  final OrderSummary orderSummary;
  final bool isSell;
  const CompanyDetail({super.key, required this.stockDetail, required this.orderSummary, required this.isSell});

  @override
  Widget build(BuildContext context) {
    var screenData = ScreenData(context: context);
    var screenWidth = screenData.screenWidth;
    var screenHeight = screenData.screeHeight;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
      decoration: BoxDecoration(
        color: AppColors.blackColor,
        boxShadow: [BoxShadow(color: AppColors.greenGradientColor, offset: Offset(0, 2), blurRadius: 30)],
      ),
      child: Column(
        spacing: screenHeight * 0.03,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Assets.images.companyLogoImage.image(width: screenWidth * 0.15, fit: BoxFit.cover),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(stockDetail!.symbol!, style: semiBoldTextStyle.copyWith(color: AppColors.whiteColor)),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kBorderRadius * 3),
                          gradient: LinearGradient(
                            colors: [AppColors.whiteColor, AppColors.whiteColor.withAlpha(100)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Container(
                          margin: EdgeInsets.all(screenWidth * 0.003),
                          padding: EdgeInsets.symmetric(vertical: screenWidth * 0.01, horizontal: screenWidth * 0.02),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kBorderRadius * 3),
                            gradient: LinearGradient(
                              colors: [AppColors.blackGradientColor, AppColors.blackColor],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                            ),
                          ),
                          child: Row(
                            children: [
                              Assets.images.necImage.image(width: screenWidth * 0.04, fit: BoxFit.cover),
                              Text(S.of(context).nse, style: mediumTextStyle.copyWith(color: AppColors.whiteColor, fontSize: 12)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(stockDetail.companyName!, style: regularTextStyle.copyWith(color: AppColors.neutralColor, fontSize: 12)),
                  Row(
                    spacing: screenWidth * 0.01,
                    children: [
                      Text(S.of(context).type, style: regularTextStyle.copyWith(color: AppColors.neutralColor, fontSize: 12)),
                      Text(stockDetail.type!, style: mediumTextStyle.copyWith(color: AppColors.whiteColor, fontSize: 12)),
                      // Container(height: screenHeight * 0.02, width: screenWidth * 0.0015, color: AppColors.blackGradientColor),
                      // Text(S.of(context).expiry, style: regularTextStyle.copyWith(color: AppColors.neutralColor, fontSize: 12)),
                      // Text(S.of(context).jun12, style: mediumTextStyle.copyWith(color: AppColors.whiteColor, fontSize: 12)),
                    ],
                  ),
                  Visibility(
                    visible: isSell,
                    child: Row(
                      spacing: screenWidth * 0.01,
                      children: [
                        Text(S.of(context).expiry, style: regularTextStyle.copyWith(color: AppColors.neutralColor, fontSize: 12)),
                        Text(S.of(context).jun12, style: mediumTextStyle.copyWith(color: AppColors.whiteColor, fontSize: 12)),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "${S.of(context).rupee}${orderSummary.potentialProfit}",
                    style: semiBoldTextStyle.copyWith(color: AppColors.whiteColor, fontSize: 18),
                  ),
                  Row(
                    children: [
                      Icon(AppIcon.dropUpIcon, color: AppColors.greenColor),
                      Text(
                        "+${stockDetail.currentPrice!} (+${stockDetail.changePercent}${S.of(context).persentage})",
                        style: mediumTextStyle.copyWith(color: AppColors.greenColor, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              marketingButton(screenWidth: screenWidth, screenHeight: screenHeight, label: S.of(context).energyMinerals),
              marketingButton(screenWidth: screenWidth, screenHeight: screenHeight, label: S.of(context).oilRefiningmarketing),
            ],
          ),
        ],
      ),
    );
  }

  Widget marketingButton({required double screenWidth, required double screenHeight, required String label}) {
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.004),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.darkGreenGradientColor, AppColors.darkGreenGradientColor],
          stops: [0.5, 1],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(kBorderRadius * 3),
      ),
      child: CustomSubmissionButton(
        label: label,
        onPressed: () {},
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.blackColor, AppColors.blackGradientColor],
            stops: [0.5, 1],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(kBorderRadius * 3),
        ),
        labelStyle: mediumTextStyle.copyWith(fontSize: 12, color: AppColors.whiteColor),
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015, horizontal: screenWidth * 0.03),
      ),
    );
  }
}
