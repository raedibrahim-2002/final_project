import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/bottom_navigation_bar.dart';
import 'package:flutter_final_graduation_project/core/utils/assets.dart';
import 'package:flutter_final_graduation_project/core/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingElevatedButtonLanguages extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  const OnBoardingElevatedButtonLanguages({
    super.key,
    required this.title,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 100,
      ),
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          minimumSize: const Size(double.infinity, 40),
          backgroundColor: const Color(0xff0D142C),
        ),
        child: Text(
          style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeightManager.semiBold,
              fontFamily: AppString.fontfamilyInter),
          this.title,
        ),
      ),
    );
  }
}
