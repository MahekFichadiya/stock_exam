import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stock_management_exam/core/locator/locator.dart';
import 'package:stock_management_exam/data/model/response_model/stock_response_model/stock_response_model.dart';
import 'package:stock_management_exam/router/app_router.gr.dart';
import 'package:stock_management_exam/ui/auth/ui/login_screen.dart';
import 'package:stock_management_exam/ui/home/store/stock_store.dart';
import 'package:stock_management_exam/ui/home/widget/duration_tab.dart';
import 'package:stock_management_exam/values/app_colors.dart';
import 'package:stock_management_exam/values/app_icon.dart';
import 'package:stock_management_exam/values/app_text_style.dart';
import 'package:stock_management_exam/values/dimention.dart';
import 'package:stock_management_exam/values/screen_data.dart';
import 'package:stock_management_exam/widget/custom_app_bar.dart';
import 'package:stock_management_exam/widget/show_message.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../generated/l10n.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var stockStore = locator<StockStore>();

  ValueNotifier<String> selectedDuration = ValueNotifier('Short Term');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSignalData();
  }

  Future<void> getSignalData() async {
    try {
      await stockStore.getSignals();
    } catch (e) {
      if (!mounted) return;
      ShowMessage(context: context, message: e.toString()).show();
    }
  }

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
          title: S.of(context).liveSignals,
          showTitle: true,
          centerTitle: true,
          action: [
            IconButton(
              onPressed: () {},
              style: IconButton.styleFrom(foregroundColor: AppColors.whiteColor),
              icon: Icon(AppIcon.searchIcon),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              style: IconButton.styleFrom(foregroundColor: AppColors.whiteColor),
              icon: Icon(AppIcon.logoutIcon),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(screenWidth * 0.05),
          child: Observer(
            builder: (context) {
              var durationTab = stockStore.stockResponseModel.data!.durationTabs;
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: durationTab?.length,
                      itemBuilder: (context, index) {
                        return ValueListenableBuilder(
                          valueListenable: selectedDuration,
                          builder: (context, value, child) {
                            return InkWell(
                              onTap: () {
                                selectedDuration.value = durationTab[index];
                              },
                              overlayColor: WidgetStatePropertyAll(AppColors.transparentColor),
                              child: DurationTab(durationTab: durationTab![index], selectedDurationTab: value),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Expanded(
                    flex: 9,
                    child: ValueListenableBuilder(
                      valueListenable: selectedDuration,
                      builder: (context, value, child) {
                        List<Signals> signalList = stockStore.stockResponseModel.data!.signals!
                            .where((element) => element.duration == value)
                            .toList();
                        return ListView.builder(
                          itemCount: signalList.length,
                          itemBuilder: (context, index) {
                            return Text(signalList[index].companyName!, style: semiBoldTextStyle.copyWith(color: AppColors.whiteColor));
                            // return Container(
                            //   margin: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(kBorderRadius * 3),
                            //     gradient: LinearGradient(
                            //       colors: [AppColors.whiteColor, AppColors.whiteColor.withAlpha(100)],
                            //       begin: Alignment.topCenter,
                            //       end: Alignment.bottomCenter,
                            //     ),
                            //   ),
                            //   child: Container(
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(kBorderRadius * 3),
                            //       gradient: LinearGradient(
                            //         colors: [AppColors.blackGradientColor, AppColors.blackColor],
                            //         begin: Alignment.bottomLeft,
                            //         end: Alignment.topRight,
                            //       ),
                            //     ),
                            //     child: Column(children: [Row(children: [])]),
                            //   ),
                            // );
                          },
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
