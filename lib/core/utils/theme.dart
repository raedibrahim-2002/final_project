import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/core/utils/colors.dart';
import 'package:flutter_final_graduation_project/core/utils/styles.dart';
import 'package:get/get.dart';

ThemeData getAppTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColorLight: BaseColors.primaryColor,
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: BaseColors.blackColor),
        color: BaseColors.whiteColor),
    iconTheme: IconThemeData(
      color: BaseColors.blackColor,
      size: 28,
    ),
    textTheme: TextTheme(
        titleMedium: getRegularTextStylePoppins(color: BaseColors.subTitle),
        displayLarge: getBoldTextStyleInter(color: BaseColors.blackColor),
        displayMedium:
            getMediumTextStyleInter(color: BaseColors.blackColor, fontSize: 20),
        displaySmall: getSemiBoldTextStyleInter(
            color: BaseColors.blackColor, fontSize: 16),
        bodyLarge: getSemiBoldTextStyleInter(
            color: BaseColors.whiteColor, fontSize: 18),
        headlineMedium:
            getMediumTextStyleInter(color: BaseColors.blackColor, fontSize: 16),
        headlineSmall:
            getMediumTextStyleInter(color: BaseColors.blackColor, fontSize: 12),
        bodyMedium:
            getRegularTextStyleInter(color: BaseColors.grey, fontSize: 12),
        labelMedium:
            getRegularTextStyleInter(fontSize: 16, color: BaseColors.grey),
        bodySmall: getRegularTextStyleInter(
            color: BaseColors.blackColor, fontSize: 10),
        labelLarge: getMediumTextStylePoppins(
            color: BaseColors.blackColor, fontSize: 14)),
  );
}
