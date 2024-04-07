import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/core/utils/assets.dart';

TextStyle _getTextStyle(
    double fontSize, FontWeight fontWeight, Color color, String fontfamily) {
  return TextStyle(
    fontFamily: fontfamily,
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

TextStyle getRegularTextStyleInter(
    {required double fontSize, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.regular,
    color,
    AppString.fontfamilyInter,
  );
}

TextStyle getBoldTextStyleInter({double fontSize = 22, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.bold,
    color,
    AppString.fontfamilyInter,
  );
}

TextStyle getSemiBoldTextStyleInter(
    {double fontSize = 22, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.semiBold,
    color,
    AppString.fontfamilyInter,
  );
}

TextStyle getMediumTextStyleInter(
    {double fontSize = 16, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.medium,
    color,
    AppString.fontfamilyInter,
  );
}

TextStyle getMediumTextStyleMontserrat(
    {double fontSize = 22, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.medium,
    color,
    AppString.fontfamilyMonserrat,
  );
}

TextStyle getMediumTextStylePoppins(
    {double fontSize = 22, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.medium,
    color,
    AppString.fontfamilyPoppins,
  );
}

TextStyle getRegularTextStylePoppins(
    {double fontSize = 14, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.regular,
    color,
    AppString.fontfamilyPoppins,
  );
}
