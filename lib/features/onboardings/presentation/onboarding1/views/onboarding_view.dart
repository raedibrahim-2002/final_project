import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/bottom_navigation_bar.dart';
import 'package:flutter_final_graduation_project/features/home/presentation/views/home_view.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingView1 extends StatefulWidget {
  OnBoardingView1({super.key});

  @override
  State<OnBoardingView1> createState() => _OnBoardingView1State();
}

class _OnBoardingView1State extends State<OnBoardingView1> {
  void initState() {
    super.initState();
    //   checkFirstSeen();
  }
// علشان تظهر اول مره فقط
  // checkFirstSeen() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   bool _seen = (prefs.getBool('seenOnBoarding') ?? false);

  //   if (!_seen) {
  //     await prefs.setBool('seenOnBoarding', true);
  //   } else {
  //     Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(builder: (context) => HomeView()),
  //     );
  //   }
  // }

  List<PageViewModel> pages = [
    PageViewModel(
      titleWidget: Text('The title of the language'),
      bodyWidget: Text('The body of the language'),
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
                'عربي',
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
                'English',
              ),
            ),
          ),
        ],
      ),
      image: Image.asset(
        'assets/images/pana.png',
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
      bodyWidget: Text(
          'Discover the world of beauty and creativity with our company’s images \nwhere wondrful ideas meet exceptional design',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: Color(0xff0D142C))),
      titleWidget: Text('Discover The World Of Beauty',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xff0D142C))),
      image: Container(
        child: Image.asset(
          'assets/images/pana2.png',
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
        'Direct communication with\n             the company',
        style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color(0xff0D142C)),
      ),
      bodyWidget: const Text(
        'Direct communication with \nthe company through a chat ',
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
                        'Sign Up',
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
                        'Continue as a guest',
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
        'assets/images/rafiki.png',
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
        done: Text('Done'),
        showSkipButton: true,
        skip: Text("Skip"),
        showNextButton: true,
        next: Icon(Icons.arrow_forward),
        onDone: () => onDone(context),
      ),
    );
  }

  void onDone(context) {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return BottomNavigationBarHelper();
      },
    ));
  }
}
