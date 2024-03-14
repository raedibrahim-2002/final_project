import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/core/utils/colors.dart';
import 'package:flutter_final_graduation_project/core/utils/styles.dart';

ThemeData getAppTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColorLight: BaseColors.primaryColor,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: BaseColors.blackColor), color: BaseColors.whiteColor),
    iconTheme: IconThemeData(
      color: BaseColors.blackColor,
      size: 28,
    ),
    textTheme: TextTheme(
      displayLarge: getBoldTextStyleInter(color: BaseColors.blackColor),
      headlineLarge: getBoldTextStyleInter(color: BaseColors.whiteColor),
    ),
  );
}
