import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/core/utils/colors.dart';
import 'package:flutter_final_graduation_project/core/utils/styles.dart';

TextTheme textThemeCustom() {
  return TextTheme(
      titleMedium: getRegularTextStylePoppins(color: BaseColors.subTitle),
      displayLarge: getBoldTextStyleInter(color: BaseColors.blackColor),
      displayMedium:
          getMediumTextStyleInter(color: BaseColors.blackColor, fontSize: 20),
      displaySmall:
          getSemiBoldTextStyleInter(color: BaseColors.blackColor, fontSize: 16),
      bodyLarge:
          getSemiBoldTextStyleInter(color: BaseColors.whiteColor, fontSize: 18),
      headlineMedium:
          getMediumTextStyleInter(color: BaseColors.blackColor, fontSize: 16),
      headlineSmall:
          getMediumTextStyleInter(color: BaseColors.blackColor, fontSize: 12),
      bodyMedium:
          getRegularTextStyleInter(color: BaseColors.grey, fontSize: 12),
      labelMedium:
          getRegularTextStyleInter(fontSize: 16, color: BaseColors.grey),
      bodySmall:
          getRegularTextStyleInter(color: BaseColors.blackColor, fontSize: 10),
      labelLarge: getMediumTextStylePoppins(
          color: BaseColors.blackColor, fontSize: 14));
}

enum AppTheme {
  lightTheme,
  darkTheme,
}

class AppThemes {
  static final appThemeData = {
    AppTheme.darkTheme: ThemeData(
      colorScheme: const ColorScheme.dark(
        primary: Color(0xffA9BBF7),
        secondary: Color(0xffC4C4C4),
        background: Colors.black,
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: BaseColors.blackColor
      ),
      textTheme:  TextTheme(
      titleMedium: getRegularTextStylePoppins(color: BaseColors.grey),
      displayLarge: getBoldTextStyleInter(color: BaseColors.whiteColor),
      displayMedium:
          getMediumTextStyleInter(color: BaseColors.whiteColor, fontSize: 20),
      displaySmall:
          getSemiBoldTextStyleInter(color: BaseColors.whiteColor, fontSize: 16),
      bodyLarge:
          getSemiBoldTextStyleInter(color: BaseColors.whiteColor, fontSize: 18),
      headlineMedium:
          getMediumTextStyleInter(color: BaseColors.whiteColor, fontSize: 16),
      headlineSmall:
          getMediumTextStyleInter(color: BaseColors.whiteColor, fontSize: 12),
      bodyMedium:
          getRegularTextStyleInter(color: BaseColors.grey, fontSize: 12),
      labelMedium:
          getRegularTextStyleInter(fontSize: 16, color: BaseColors.grey),
      bodySmall:
          getRegularTextStyleInter(color: BaseColors.whiteColor, fontSize: 10),
      labelLarge: getMediumTextStylePoppins(
          color: BaseColors.whiteColor, fontSize: 14)),
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: BaseColors.whiteColor),
          color: BaseColors.blackColor),
      iconTheme: const IconThemeData(
        color: BaseColors.whiteColor,
        size: 28,
      ),
      
    ),

    //
    //

    AppTheme.lightTheme: ThemeData(
      colorScheme: const ColorScheme.light(
        background: Colors.white,
        primary: BaseColors.primaryColor,
        secondary: Color(0xffC4C4C4),
      ),
      dividerColor: const Color(0xff757575),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.black),
        ),
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: BaseColors.whiteColor
      ),
      textTheme: textThemeCustom(),
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: BaseColors.blackColor),
          color: BaseColors.whiteColor),
      iconTheme: const IconThemeData(
        color: BaseColors.black12,
        size: 28,
      ),
    ),
  };
}
