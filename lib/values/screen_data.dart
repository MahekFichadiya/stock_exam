import 'package:flutter/cupertino.dart';

class ScreenData {
  final BuildContext context;
  ScreenData({required this.context});

  late final screenWidth = MediaQuery.widthOf(context);
  late final screeHeight = MediaQuery.heightOf(context);
}
