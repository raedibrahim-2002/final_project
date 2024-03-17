import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/bottom_navigation_bar.dart';
import 'package:flutter_final_graduation_project/core/utils/assets.dart';
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
    // checkOnBoarding();
  }

  void checkOnBoarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool onBoarding = prefs.getBool("onBoarding") ?? false;
    if (onBoarding) {
      // إذا كانت قيمة onBoarding تساوي true، انتقل مباشرة لصفحة BottomNavigationBarHelper
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomNavigationBarHelper()),
      );
    }
  }

  List<PageViewModel> pages = [
    PageViewModel(
      titleWidget: Text(OnBoardingAssets.title1),
      bodyWidget: Text(OnBoardingAssets.body1),
      footer: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
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
                style: TextStyle(color: Colors.white),
                OnBoardingAssets.arabicButton,
              ),
            ),
          ),
          Padding(
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
                style: TextStyle(color: Colors.white),
                OnBoardingAssets.englishButton,
              ),
            ),
          ),
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
    ),
    PageViewModel(
      bodyWidget: Text(OnBoardingAssets.body2,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: Color(0xff0D142C))),
      titleWidget: Text(OnBoardingAssets.title2,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xff0D142C))),
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
    ),
    PageViewModel(
      titleWidget: Text(
        OnBoardingAssets.title3,
        style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color(0xff0D142C)),
      ),
      bodyWidget: const Text(
        OnBoardingAssets.body3,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
      ),
      footer: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        minimumSize: const Size(double.infinity, 40),
                        backgroundColor: const Color(0xff0D142C),
                      ),
                      child: const Text(
                        style: TextStyle(color: Colors.white),
                        OnBoardingAssets.signUpButton,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        minimumSize: const Size(double.infinity, 40),
                        backgroundColor: const Color(0xff0D142C),
                      ),
                      child: const Text(
                        style: TextStyle(color: Colors.white),
                        OnBoardingAssets.continueAsGuestButton,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
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
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false
      ),
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        pages: pages,
        dotsDecorator: DotsDecorator(
            size: Size.square(10),
            color: Color.fromARGB(255, 120, 112, 5),
            activeSize: Size(20, 20),
            activeColor: Color.fromARGB(255, 5, 20, 56),
            spacing: EdgeInsets.symmetric(horizontal: 5),
            activeShape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(25))),
        showDoneButton: true,
        done: Text(OnBoardingAssets.done),
        showSkipButton: true,
        skip: Text(OnBoardingAssets.skip),
        showNextButton: true,
        next: Icon(Icons.arrow_forward),
        onDone: () => onDone(context),
      ),
    );
  }

  void onDone(context) async {
    final pres = await SharedPreferences.getInstance();
    pres.setBool("onBoarding", true);
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return BottomNavigationBarHelper();
      },
    ));
  }
}
