import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/bottom_navigation_bar.dart';
import 'package:flutter_final_graduation_project/core/utils/assets.dart';
import 'package:flutter_final_graduation_project/core/utils/colors.dart';
import 'package:flutter_final_graduation_project/features/filter/presentation/views/widgets/elevated_button.dart';
import 'package:flutter_final_graduation_project/features/login_and_signUp/presentation/views/login_view.dart';
import 'package:flutter_final_graduation_project/features/onboardings/presentation/onboarding1/widgets/onboarding_pages_view.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingView1 extends StatefulWidget {
  OnBoardingView1({super.key});

  @override
  State<OnBoardingView1> createState() => _OnBoardingView1State();
}

class _OnBoardingView1State extends State<OnBoardingView1> {
  void initState() {
    super.initState();
    checkOnBoarding();
  }

  void checkOnBoarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool onBoarding = prefs.getBool("onBoarding") ?? false;
    if (onBoarding) {
      // إذا كانت قيمة onBoarding تساوي true، انتقل مباشرة لصفحة LoginScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  List<PageViewModel> pages = [
    OnBoardingPageView1(),
    OnBoardingPageView2(),
    OnBoardingPageView3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false),
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        pages: pages,
        dotsDecorator: DotsDecorator(
            size: const Size.square(10),
            color: const Color.fromARGB(255, 120, 112, 5),
            activeSize: const Size(20, 20),
            activeColor: const Color.fromARGB(255, 5, 20, 56),
            spacing: const EdgeInsets.symmetric(horizontal: 5),
            activeShape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(25))),
        showDoneButton: true,
        done: ElevatedButton(
          onPressed: () {
            onDone(context);
          },
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: const Color(0xff0D142C),
          ),
          child: Text(
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeightManager.medium,
              fontSize: 12,
              fontFamily: AppString.fontfamilyInter,
            ),
            "Sign up".tr,
          ),
        ),
        showSkipButton: true,
        skip: Text("21".tr),
        showNextButton: true,
        next: const Icon(Icons.arrow_forward),
        onDone: () => onDone(context),
      ),
    );
  }

  void onDone(context) async {
    final pres = await SharedPreferences.getInstance();
    pres.setBool("onBoarding", true);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const LoginScreen();
        },
      ),
    );
  }
}
