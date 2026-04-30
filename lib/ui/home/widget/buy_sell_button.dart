import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../../values/app_colors.dart';
import '../../../values/app_text_style.dart';
import '../../../values/dimension.dart';
import '../../../values/screen_data.dart';

class BuySellButton extends StatelessWidget {
  final String label;
  final VoidCallback changeSelection;
  final Color selectedBackgroundColor;
  const BuySellButton({super.key, required this.label, required this.changeSelection, required this.selectedBackgroundColor});

  @override
  Widget build(BuildContext context) {
    var screenData = ScreenData(context: context);
    var screenWidth = screenData.screenWidth;
    return Expanded(
      child: InkWell(
        onTap: changeSelection,
        overlayColor: WidgetStatePropertyAll(AppColors.transparentColor),
        child: Container(
          padding: EdgeInsets.all(screenWidth * 0.03),
          alignment: Alignment.center,
          decoration: BoxDecoration(color: selectedBackgroundColor, borderRadius: BorderRadius.circular(kBorderRadius * 3)),
          child: Text(S.of(context).buy, style: semiBoldTextStyle.copyWith(color: AppColors.whiteColor)),
        ),
      ),
    );
  }
}
