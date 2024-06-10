import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/core/local/local_controller.dart';
import 'package:flutter_final_graduation_project/core/utils/assets.dart';
import 'package:flutter_final_graduation_project/core/utils/shared_prefrences.dart';
import 'package:flutter_final_graduation_project/features/onboardings/presentation/onboarding1/widgets/onBoardingelevatedButtons.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

PageViewModel OnBoardingPageView1() {
  MyLocalController controllerLang = Get.find();

  return PageViewModel(
    titleWidget: Text(OnBoardingAssets.title1),
    bodyWidget: Text(
      OnBoardingAssets.body1,
    ),
    footer: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OnBoardingElevatedButtonLanguages(
          title: "20".tr,
          onPress: () {
            PreferenceUtils.setString(PrefKeys.language, "ar");
            controllerLang.changeLang("ar");
          },
        ),
        OnBoardingElevatedButtonLanguages(
          title: "6".tr,
          onPress: () {
            PreferenceUtils.setString(PrefKeys.language, "en");
            controllerLang.changeLang("en");
          },
        )
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
      "Discover the world of beauty".tr,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeightManager.regular,
        fontFamily: AppString.fontfamilyInter,
        color: Color(0xff0D142C),
      ),
    ),
    titleWidget: Text(
      "Discover The World Of Beauty".tr,
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
      "Direct".tr,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeightManager.semiBold,
        fontFamily: AppString.fontfamilyInter,
        color: Color(0xff0D142C),
      ),
    ),
    bodyWidget: Text(
      "Direct communication with \nthe company through a chat".tr,
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
