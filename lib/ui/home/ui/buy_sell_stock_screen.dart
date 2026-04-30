import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:stock_management_exam/ui/home/store/stock_store.dart';
import 'package:stock_management_exam/ui/home/widget/bottom_ui_buy_sell_screen.dart';
import 'package:stock_management_exam/ui/home/widget/buy_sell_button.dart';
import 'package:stock_management_exam/ui/home/widget/company_detail.dart';
import 'package:stock_management_exam/ui/home/widget/order_preference.dart';
import 'package:stock_management_exam/ui/home/widget/product_and_order_section.dart';
import 'package:stock_management_exam/values/app_colors.dart';
import 'package:stock_management_exam/values/app_icon.dart';
import 'package:stock_management_exam/values/screen_data.dart';
import 'package:stock_management_exam/widget/custom_app_bar.dart';
import 'package:stock_management_exam/widget/show_message.dart';

import '../../../generated/l10n.dart';
import '../../../values/dimension.dart';

@RoutePage()
class BuySellStockScreen extends StatefulWidget {
  final int stockId;
  const BuySellStockScreen({super.key, required this.stockId});

  @override
  State<BuySellStockScreen> createState() => _BuySellStockScreenState();
}

class _BuySellStockScreenState extends State<BuySellStockScreen> {
  ValueNotifier<bool> isSell = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    getStockDetail(widget.stockId);
  }

  Future<void> getStockDetail(int id) async {
    try {
      await stockStore.getStockDetail(id);
      if (!mounted) return;
      ShowMessage(context: context, message: stockStore.successMessage).show();
    } catch (e) {
      if (!mounted) return;
      ShowMessage(context: context, message: e.toString()).show();
    }
  }

  List<String> selectedProductType = [];

  @override
  Widget build(BuildContext context) {
    var screenData = ScreenData(context: context);
    var screenWidth = screenData.screenWidth;
    var screenHeight = screenData.screeHeight;
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        appBar: CustomAppBar(
          leading: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: IconButton(
              onPressed: () {
                context.pop();
              },
              style: IconButton.styleFrom(foregroundColor: AppColors.whiteColor),
              icon: Icon(AppIcon.circularBackArrowIcon),
            ),
          ),
          action: [
            IconButton(
              onPressed: () {},
              style: IconButton.styleFrom(foregroundColor: AppColors.amberColor),
              icon: Icon(AppIcon.alarmIcon),
            ),
            IconButton(
              onPressed: () {},
              style: IconButton.styleFrom(foregroundColor: AppColors.whiteColor),
              icon: Icon(AppIcon.starIcon),
            ),
          ],
        ),
        body: Observer(
          builder: (context) {
            if (stockStore.isLoading) {
              return Center(child: CircularProgressIndicator(color: AppColors.greenColor));
            } else {
              var stockDetail = stockStore.particularSignal.data!.signal;
              var productType = stockStore.particularSignal.data!.signal!.productType;
              var orderType = stockStore.particularSignal.data!.signal!.orderType;
              var orderSummary = stockStore.particularSignal.data!.signal!.orderSummary;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    //company detail
                    ValueListenableBuilder(
                      valueListenable: isSell,
                      builder: (context, value, child) {
                        return CompanyDetail(stockDetail: stockDetail!, orderSummary: orderSummary!, isSell: value);
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.all(screenWidth * 0.08),
                      child: Column(
                        spacing: screenHeight * 0.03,
                        children: [
                          //buy and sell button
                          Container(
                            padding: EdgeInsets.all(screenWidth * 0.005),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(kBorderRadius * 3),
                              border: Border.all(color: AppColors.blackGradientColor),
                            ),
                            child: ValueListenableBuilder(
                              valueListenable: isSell,
                              builder: (context, value, child) {
                                return Row(
                                  children: [
                                    BuySellButton(
                                      label: S.of(context).buy,
                                      changeSelection: () {
                                        isSell.value = false;
                                      },
                                      selectedBackgroundColor: isSell.value ? AppColors.blackColor : AppColors.greenColor,
                                    ),
                                    BuySellButton(
                                      label: S.of(context).sell,
                                      changeSelection: () {
                                        isSell.value = true;
                                      },
                                      selectedBackgroundColor: isSell.value ? AppColors.redColor : AppColors.blackColor,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),

                          //product and order selection
                          Container(
                            padding: EdgeInsets.all(screenWidth * 0.05),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.blackGradientColor),
                              borderRadius: BorderRadius.circular(kBorderRadius * 3),
                            ),
                            child: Row(
                              spacing: screenWidth * 0.03,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ProductSelection(label: S.of(context).productType, product: productType),
                                OrderSelection(label: S.of(context).orderType, product: orderType),
                              ],
                            ),
                          ),

                          //order preference
                          OrderPreference(isSell: isSell, orderSummary: orderSummary),

                          //Bottom section
                          BottomUiBuySellScreen(isSell: isSell),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
