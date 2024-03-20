import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/bottom_navigation_bar.dart';
import 'package:flutter_final_graduation_project/core/utils/assets.dart';
import 'package:flutter_final_graduation_project/core/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ElevatedButtonForEnglish extends StatelessWidget {
  const ElevatedButtonForEnglish({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
          minimumSize: const Size(double.infinity, 40),
          backgroundColor: const Color(0xff0D142C),
        ),
        child: const Text(
          style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeightManager.semiBold,
              fontFamily: AppString.fontfamilyInter),
          OnBoardingAssets.englishButton,
        ),
      ),
    );
  }
}

class ElevatedButtonForArabic extends StatelessWidget {
  const ElevatedButtonForArabic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
          minimumSize: const Size(double.infinity, 40),
          backgroundColor: const Color(0xff0D142C),
        ),
        child: const Text(
          style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeightManager.semiBold,
              fontFamily: AppString.fontfamilyInter),
          OnBoardingAssets.arabicButton,
        ),
      ),
    );
  }
}


class ElevatedButtonForContinuingAsGuest extends StatelessWidget {
  const ElevatedButtonForContinuingAsGuest({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ElevatedButton(
        onPressed: () async {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return BottomNavigationBarHelper();
              },
            ),
          );
          final pres = await SharedPreferences.getInstance();
          pres.setBool("onBoarding", true);
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
          minimumSize: const Size(double.infinity, 40),
          backgroundColor: BaseColors.grey,
        ),
        child: Text(
          OnBoardingAssets.continueAsGuestButton,
          style: TextStyle(
            color: BaseColors.blackColor,
            fontWeight: FontWeightManager.medium,
            fontSize: 18,
            fontFamily: AppString.fontfamilyInter,
          ),
        ),
      ),
    );
  }
}