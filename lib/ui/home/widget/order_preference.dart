import 'package:flutter/material.dart';
import 'package:stock_management_exam/data/model/response_model/stock_response_model/particular_signal.dart';

import '../../../generated/assets.dart';
import '../../../generated/l10n.dart';
import '../../../values/app_colors.dart';
import '../../../values/app_icon.dart';
import '../../../values/app_text_style.dart';
import '../../../values/dimension.dart';
import '../../../values/screen_data.dart';

class OrderPreference extends StatefulWidget {
  final OrderSummary? orderSummary;
  final ValueNotifier isSell;
  const OrderPreference({super.key, required this.orderSummary, required this.isSell});

  @override
  State<OrderPreference> createState() => _OrderPreferenceState();
}

class _OrderPreferenceState extends State<OrderPreference> {
  ValueNotifier<bool> setAlarm = ValueNotifier(true);
  @override
  Widget build(BuildContext context) {
    var screenData = ScreenData(context: context);
    var screenWidth = screenData.screenWidth;
    var screenHeight = screenData.screeHeight;
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.05),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.blackGradientColor),
        borderRadius: BorderRadius.circular(kBorderRadius * 3),
      ),
      child: Column(
        spacing: screenHeight * 0.03,
        children: [
          Row(
            spacing: screenWidth * 0.02,
            children: [
              Assets.images.orderPreferencesImage.image(),
              Expanded(
                flex: 2,
                child: Text(
                  S.of(context).orderPreference,
                  style: semiBoldTextStyle.copyWith(color: AppColors.whiteColor, fontSize: 18, overflow: TextOverflow.ellipsis),
                ),
              ),
              Icon(AppIcon.errorIcon, color: AppColors.whiteColor),
              Assets.images.robotImage.image(),
              Expanded(
                child: Text(
                  S.of(context).aiAssisted,
                  style: mediumTextStyle.copyWith(color: AppColors.amberColor, fontSize: 12, overflow: TextOverflow.ellipsis),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(screenWidth * 0.03),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.blackGradientColor),
              borderRadius: BorderRadius.circular(kBorderRadius * 2),
            ),
            child: Column(
              spacing: screenHeight * 0.03,
              children: [
                Row(
                  spacing: screenWidth * 0.03,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textWithErrorIcon(
                      S.of(context).entryRange,
                      mediumTextStyle.copyWith(color: AppColors.whiteColor, fontSize: 14, overflow: TextOverflow.ellipsis),
                    ),
                    Text("${S.of(context).rupee}${widget.orderSummary?.entryRange}", style: semiBoldTextStyle.copyWith(color: AppColors.whiteColor)),
                  ],
                ),
                Row(
                  spacing: screenWidth * 0.03,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textWithErrorIcon(
                      S.of(context).stopLoss,
                      mediumTextStyle.copyWith(color: AppColors.whiteColor, fontSize: 14, overflow: TextOverflow.ellipsis),
                    ),
                    Text("${S.of(context).rupee}${widget.orderSummary?.stopLoss}", style: semiBoldTextStyle.copyWith(color: AppColors.whiteColor)),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(screenWidth * 0.03),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.blackGradientColor),
                    borderRadius: BorderRadius.circular(kBorderRadius),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        spacing: screenWidth * 0.01,
                        children: [
                          Text(S.of(context).slTrigger, style: regularTextStyle.copyWith(color: AppColors.whiteColor.withAlpha(150), fontSize: 12)),
                          Text(
                            "${S.of(context).rupee}${S.of(context).slTriggerValue}",
                            style: semiBoldTextStyle.copyWith(color: AppColors.whiteColor, fontSize: 12),
                          ),
                        ],
                      ),
                      ValueListenableBuilder(
                        valueListenable: widget.isSell,
                        builder: (context, value, child) {
                          return value
                              ? Row(
                                  spacing: screenWidth * 0.01,
                                  children: [
                                    Text(
                                      S.of(context).slLimit,
                                      style: regularTextStyle.copyWith(color: AppColors.whiteColor.withAlpha(150), fontSize: 12),
                                    ),
                                    Text(
                                      "${S.of(context).rupee}${S.of(context).slLimitValue}",
                                      style: semiBoldTextStyle.copyWith(color: AppColors.whiteColor, fontSize: 12),
                                    ),
                                  ],
                                )
                              : Row(
                                  spacing: screenWidth * 0.01,
                                  children: [
                                    Text(
                                      S.of(context).slMarket,
                                      style: regularTextStyle.copyWith(color: AppColors.whiteColor.withAlpha(150), fontSize: 12),
                                    ),
                                    Icon(AppIcon.lockIcon, color: AppColors.whiteColor.withAlpha(150), size: screenHeight * 0.02),
                                  ],
                                );
                        },
                      ),
                    ],
                  ),
                ),
                Row(
                  spacing: screenWidth * 0.03,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textWithErrorIcon(
                      S.of(context).target,
                      mediumTextStyle.copyWith(color: AppColors.whiteColor, fontSize: 14, overflow: TextOverflow.ellipsis),
                    ),
                    Text("${S.of(context).rupee}${widget.orderSummary?.targetPrice}", style: semiBoldTextStyle.copyWith(color: AppColors.whiteColor)),
                  ],
                ),

                ValueListenableBuilder(
                  valueListenable: setAlarm,
                  builder: (context, value, child) => Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          S.of(context).setAlertWhenYourOrderHitsTarget,
                          style: lightTextStyle.copyWith(color: AppColors.whiteColor.withAlpha(150), fontSize: 12),
                        ),
                      ),
                      Expanded(
                        child: Switch(
                          value: value,
                          onChanged: (value) {
                            setAlarm.value = value;
                          },
                          activeThumbColor: AppColors.greenColor,
                          inactiveThumbColor: AppColors.whiteColor,
                          activeTrackColor: AppColors.darkGreenGradientColor,
                        ),
                      ),
                    ],
                  ),
                ),

                Row(
                  spacing: screenWidth * 0.03,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      spacing: screenWidth * 0.01,
                      children: [
                        Icon(AppIcon.circleIcon, color: AppColors.greenColor, size: screenHeight * 0.025),
                        Text(
                          S.of(context).live,
                          style: mediumTextStyle.copyWith(color: AppColors.greenColor, fontSize: 14, overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                    Text("${S.of(context).rupee}${widget.orderSummary?.targetPrice}", style: semiBoldTextStyle.copyWith(color: AppColors.whiteColor)),
                  ],
                ),
              ],
            ),
          ),

          //alert note
          ValueListenableBuilder(
            valueListenable: widget.isSell,
            builder: (context, value, child) {
              return Container(
                padding: EdgeInsets.all(screenWidth * 0.05),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(kBorderRadius * 3), color: AppColors.amberColor.withAlpha(50)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Icon(AppIcon.warningIcon, color: AppColors.amberColor)),
                    Expanded(
                      flex: 6,
                      child: Text(
                        value ? S.of(context).ifYouWantToPlaceAStopLossOrTarget : S.of(context).dueToExchangeRegulationsWeWillOnlyBePlacingYour,
                        style: regularTextStyle.copyWith(color: AppColors.amberColor, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          Divider(color: AppColors.blackGradientColor, thickness: screenHeight * 0.002),

          Row(
            spacing: screenWidth * 0.03,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.of(context).yourTradingCapital,
                style: semiBoldTextStyle.copyWith(color: AppColors.whiteColor, fontSize: 14, overflow: TextOverflow.ellipsis),
              ),
              Row(
                spacing: screenHeight * 0.01,
                children: [
                  Text(
                    "${S.of(context).rupee}${widget.orderSummary?.tradingCapital}",
                    style: semiBoldTextStyle.copyWith(color: AppColors.whiteColor),
                  ),
                  Icon(AppIcon.editIcon, color: AppColors.whiteColor),
                ],
              ),
            ],
          ),
          Row(
            spacing: screenWidth * 0.03,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.of(context).perTradeRisk,
                style: semiBoldTextStyle.copyWith(color: AppColors.whiteColor, fontSize: 14, overflow: TextOverflow.ellipsis),
              ),
              Row(
                spacing: screenHeight * 0.01,
                children: [
                  Text(
                    "${S.of(context).rupee}${widget.orderSummary?.perTradeRisk}(${widget.orderSummary?.perTradePercentageRisk})",
                    style: semiBoldTextStyle.copyWith(color: AppColors.whiteColor),
                  ),
                  Icon(AppIcon.editIcon, color: AppColors.whiteColor),
                ],
              ),
            ],
          ),

          Divider(color: AppColors.blackGradientColor, thickness: screenHeight * 0.002),

          Row(
            spacing: screenWidth * 0.02,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        spacing: screenWidth * 0.01,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Assets.images.chartImage.image(height: screenHeight * 0.02, fit: BoxFit.cover),
                          textWithErrorIcon(S.of(context).tradeRisk, semiBoldTextStyle.copyWith(color: AppColors.whiteColor, fontSize: 14)),
                        ],
                      ),
                      Text("${widget.orderSummary?.tradeRisk}", style: semiBoldTextStyle.copyWith(color: AppColors.whiteColor)),
                    ],
                  ),
                ),
              ),
              Container(height: screenHeight * 0.1, width: screenWidth * 0.002, color: AppColors.blackGradientColor),
              Expanded(
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        spacing: screenWidth * 0.01,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Assets.images.qualityImage.image(height: screenHeight * 0.02, fit: BoxFit.cover),
                          textWithErrorIcon(S.of(context).quantity, semiBoldTextStyle.copyWith(color: AppColors.whiteColor, fontSize: 14)),
                        ],
                      ),
                      Text(
                        "${widget.orderSummary?.quantityToTrade} ${S.of(context).shares}",
                        style: semiBoldTextStyle.copyWith(color: AppColors.whiteColor),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Container(
            padding: EdgeInsets.all(screenWidth * 0.05),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kBorderRadius),
              color: AppColors.greenColor.withAlpha(50),
              border: Border(bottom: BorderSide(color: AppColors.greenColor)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    spacing: screenWidth * 0.01,
                    children: [
                      Assets.images.profitImage.image(height: screenHeight * 0.02, fit: BoxFit.cover),
                      Text(S.of(context).potentialProfit, style: semiBoldTextStyle.copyWith(color: AppColors.greenColor, fontSize: 14)),
                      Icon(AppIcon.errorIcon, color: AppColors.greenColor, size: screenHeight * 0.025),
                    ],
                  ),
                ),
                Text("${S.of(context).rupee}${widget.orderSummary?.potentialProfit}", style: semiBoldTextStyle.copyWith(color: AppColors.greenColor)),
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(S.of(context).marginRequired, style: semiBoldTextStyle.copyWith(color: AppColors.whiteColor, fontSize: 14)),
                    Text(
                      "${S.of(context).rupee}${widget.orderSummary?.marginRequired}",
                      style: semiBoldTextStyle.copyWith(color: AppColors.whiteColor, fontSize: 14),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(S.of(context).marginAvailable, style: semiBoldTextStyle.copyWith(color: AppColors.whiteColor, fontSize: 14)),
                    Text(
                      "${S.of(context).rupee}${widget.orderSummary?.marginAvailable}",
                      style: semiBoldTextStyle.copyWith(color: AppColors.whiteColor, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),

          ValueListenableBuilder(
            valueListenable: widget.isSell,
            builder: (context, value, child) => Visibility(
              visible: value,
              child: Container(
                padding: EdgeInsets.all(screenWidth * 0.05),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(kBorderRadius), color: AppColors.redColor.withAlpha(50)),
                alignment: Alignment.topLeft,
                child: Text(S.of(context).fundLimitInsufficientBy125322, style: regularTextStyle.copyWith(color: AppColors.redColor, fontSize: 12)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget textWithErrorIcon(String label, TextStyle labelStyle) {
    var screenWidth = ScreenData(context: context).screenWidth;
    var screenHeight = ScreenData(context: context).screeHeight;
    return Row(
      spacing: screenWidth * 0.01,
      children: [
        Text(label, style: labelStyle),
        Icon(AppIcon.errorIcon, color: AppColors.whiteColor, size: screenHeight * 0.025),
      ],
    );
  }
}
