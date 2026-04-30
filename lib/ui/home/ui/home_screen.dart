import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stock_management_exam/data/model/response_model/stock_response_model/stock_response_model.dart';
import 'package:stock_management_exam/router/app_router.gr.dart';
import 'package:stock_management_exam/ui/auth/store/auth_store.dart';
import 'package:stock_management_exam/ui/home/store/stock_store.dart';
import 'package:stock_management_exam/ui/home/widget/duration_tab.dart';
import 'package:stock_management_exam/ui/home/widget/show_signal.dart';
import 'package:stock_management_exam/values/app_colors.dart';
import 'package:stock_management_exam/values/app_icon.dart';
import 'package:stock_management_exam/values/screen_data.dart';
import 'package:stock_management_exam/widget/custom_app_bar.dart';
import 'package:stock_management_exam/widget/show_message.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:stock_management_exam/widget/show_success.dart';

import '../../../generated/l10n.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ValueNotifier<String> selectedDuration = ValueNotifier(stockStore.stockResponseModel.data!.durationTabs![0]);

  @override
  void initState() {
    super.initState();
    getSignalData();
  }

  Future<void> getSignalData() async {
    try {
      await stockStore.getSignals();
      if (!mounted) return;
      ShowMessage(context: context, message: stockStore.successMessage).show();
    } catch (e) {
      if (!mounted) return;
      ShowMessage(context: context, message: e.toString()).show();
    }
  }

  Future<void> logout(int id) async {
    if (await authStore.logout(id)) {
      if (!mounted) return;
      ShowSuccess(
        context: context,
        isError: false,
        successMessage: authStore.successMessage,
        onSuccessCallBack: () {
          context.router.replaceAll([LoginRoute()]);
        },
      ).show();
    } else {
      if (!mounted) return;
      ShowSuccess(context: context, isError: true, errorMessage: authStore.errorMessage).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenData = ScreenData(context: context);
    var screenWidth = screenData.screenWidth;
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
                print("-------user id----------");
                print(authStore.userResponseModel!.data!.user!.id!);
                logout(authStore.userResponseModel!.data!.user!.id!);
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
              if (stockStore.isLoading) {
                return Center(child: CircularProgressIndicator(color: AppColors.greenColor));
              } else {
                var durationTab = stockStore.stockResponseModel.data!.durationTabs;
                if (!durationTab!.contains(S.of(context).all)) {
                  durationTab.insert(0, S.of(context).all);
                }
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: AlwaysScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: durationTab.length,
                        itemBuilder: (context, index) {
                          return ValueListenableBuilder(
                            valueListenable: selectedDuration,
                            builder: (context, value, child) {
                              return InkWell(
                                onTap: () {
                                  selectedDuration.value = durationTab[index];
                                },
                                overlayColor: WidgetStatePropertyAll(AppColors.transparentColor),
                                child: DurationTab(durationTab: durationTab[index], selectedDurationTab: value),
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
                          List<Signals> signalList = value == S.of(context).all
                              ? stockStore.stockResponseModel.data!.signals!
                              : stockStore.stockResponseModel.data!.signals!.where((element) => element.duration == value).toList();
                          return ShowSignal(signalList: signalList);
                        },
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
