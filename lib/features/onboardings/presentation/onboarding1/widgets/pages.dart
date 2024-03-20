import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/core/utils/assets.dart';
import 'package:flutter_final_graduation_project/features/onboardings/presentation/onboarding1/widgets/elevatedButtons.dart';
import 'package:introduction_screen/introduction_screen.dart';

PageViewModel OnBoardingPageView1() {
  return PageViewModel(
    titleWidget: Text(OnBoardingAssets.title1),
    bodyWidget: Text(
      OnBoardingAssets.body1,
    ),
    footer: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButtonForArabic(),
        ElevatedButtonForEnglish(),
      ],
    ),
    image: Image.asset(
      OnBoardingAssets.image1,
      fit: BoxFit.contain,
    ),
    decoration: PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

PageViewModel OnBoardingPageView2() {
  return PageViewModel(
    bodyWidget: Text(
      OnBoardingAssets.body2,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeightManager.regular,
        fontFamily: AppString.fontfamilyInter,
        color: Color(0xff0D142C),
      ),
    ),
    titleWidget: Text(
      OnBoardingAssets.title2,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeightManager.semiBold,
        fontFamily: AppString.fontfamilyInter,
        color: Color(0xff0D142C),
      ),
    ),
    image: Container(
      child: Image.asset(
        OnBoardingAssets.image2,
      ),
    ),
    decoration: PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

PageViewModel OnBoardingPageView3() {
  return PageViewModel(
    titleWidget: Text(
      OnBoardingAssets.title3,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeightManager.semiBold,
        fontFamily: AppString.fontfamilyInter,
        color: Color(0xff0D142C),
      ),
    ),
    bodyWidget: const Text(
      OnBoardingAssets.body3,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeightManager.regular,
        fontFamily: AppString.fontfamilyInter,
        color: Color(0xff0D142C),
      ),
    ),
    image: Image.asset(
      OnBoardingAssets.image3,
      height: 400,
      width: 400,
    ),
    decoration: PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
