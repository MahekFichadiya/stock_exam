import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stock_management_exam/data/model/response_model/stock_response_model/stock_response_model.dart';
import 'package:stock_management_exam/router/app_router.gr.dart';

import '../../../generated/assets.dart';
import '../../../generated/l10n.dart';
import '../../../values/app_colors.dart';
import '../../../values/app_icon.dart';
import '../../../values/app_text_style.dart';
import '../../../values/dimention.dart';
import '../../../values/screen_data.dart';
import '../../../widget/custom_submission_button.dart';

class ShowSignal extends StatelessWidget {
  final List<Signals> signalList;
  const ShowSignal({super.key, required this.signalList});

  @override
  Widget build(BuildContext context) {
    var screenData = ScreenData(context: context);
    var screenWidth = screenData.screenWidth;
    var screenHeight = screenData.screeHeight;
    return ListView.builder(
      itemCount: signalList.length,
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
      itemBuilder: (context, index) {
        return Stack(
          alignment: Alignment.topLeft,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
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
                padding: EdgeInsets.all(screenWidth * 0.05),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kBorderRadius * 3),
                  gradient: LinearGradient(
                    colors: [AppColors.blackGradientColor, AppColors.blackColor],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      spacing: screenWidth * 0.03,
                      children: [
                        Assets.images.companyLogoImage.image(width: screenWidth * 0.15, fit: BoxFit.cover),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(signalList[index].symbol!, style: semiBoldTextStyle.copyWith(color: AppColors.whiteColor)),
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
                            Text(signalList[index].companyName!, style: mediumTextStyle.copyWith(color: AppColors.neutralColor, fontSize: 12)),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(S.of(context).ltp, style: mediumTextStyle.copyWith(color: AppColors.whiteColor, fontSize: 12)),
                            Row(
                              children: [
                                Icon(AppIcon.dropUpIcon, color: AppColors.greenColor),
                                Text("${signalList[index].currentPrice!}", style: semiBoldTextStyle.copyWith(color: AppColors.greenColor)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(S.of(context).gainSoFar, style: mediumTextStyle.copyWith(color: AppColors.whiteColor, fontSize: 12)),
                            Text(
                              "${signalList[index].gainSoFar!} ${S.of(context).persentage}",
                              style: semiBoldTextStyle.copyWith(color: AppColors.blueColor, fontSize: 14),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(S.of(context).potentialLeft, style: mediumTextStyle.copyWith(color: AppColors.whiteColor, fontSize: 12)),
                            Text(
                              "${signalList[index].potentialLeft!} ${S.of(context).persentage}",
                              style: semiBoldTextStyle.copyWith(color: AppColors.blueColor, fontSize: 14),
                            ),
                          ],
                        ),
                        CustomSubmissionButton(
                          label: S.of(context).tradeNow,
                          onPressed: () {
                            context.router.push(BuySellStockRoute());
                          },
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [AppColors.greenColor, AppColors.greenGradientColor],
                              stops: [0.2, 1],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.circular(kBorderRadius * 3),
                          ),
                          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015, horizontal: screenWidth * 0.03),
                          labelStyle: semiBoldTextStyle.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.05,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kBorderRadius * 3),
                  gradient: LinearGradient(
                    colors: [AppColors.pinkColor, AppColors.pinkGradientColor],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01, horizontal: screenWidth * 0.03),
                child: Text(S.of(context).intraday, style: mediumTextStyle.copyWith(color: AppColors.whiteColor, fontSize: 10)),
              ),
            ),
            Positioned(
              right: screenWidth * 0.05,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kBorderRadius),
                  gradient: LinearGradient(
                    colors: [AppColors.greenColor, AppColors.greenGradientColor],
                    stops: [0.2, 1],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01, horizontal: screenWidth * 0.03),
                child: Text(signalList[index].duration!, style: mediumTextStyle.copyWith(fontSize: 10)),
              ),
            ),
          ],
        );
      },
    );
  }
}
