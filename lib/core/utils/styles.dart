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
    {double fontSize = 22, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.regular,
    color,
    AssetsData.fontfamilyInter,
  );
}

TextStyle getBoldTextStyleInter({double fontSize = 22, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.bold,
    color,
    AssetsData.fontfamilyInter,
  );
}

TextStyle getSemiBoldTextStyleInter(
    {double fontSize = 22, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.semiBold,
    color,
    AssetsData.fontfamilyInter,
  );
}

TextStyle getMediumTextStyleInter(
    {double fontSize = 22, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.medium,
    color,
    AssetsData.fontfamilyInter,
  );
}

TextStyle getMediumTextStyleMontserrat(
    {double fontSize = 22, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.medium,
    color,
    AssetsData.fontfamilyMonserrat,
  );
}

TextStyle getMediumTextStylePoppins(
    {double fontSize = 22, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.medium,
    color,
    AssetsData.fontfamilyPoppins,
  );
}

TextStyle getRegularTextStylePoppins(
    {double fontSize = 14, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.regular,
    color,
    AssetsData.fontfamilyPoppins,
  );
}
