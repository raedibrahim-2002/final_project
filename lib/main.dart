import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/features/onboardings/presentation/onboarding1/views/onboarding_view.dart';
import 'package:flutter_final_graduation_project/features/splash/presentation/view/splash_view.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
          size: 28,
        ),
        appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Colors.black), color: Colors.white),
        textTheme: TextTheme(
            displayLarge: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
            headlineLarge: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
            bodyMedium: TextStyle(
                color: Colors.black26,
                fontSize: 18,
                fontWeight: FontWeight.bold),
            bodySmall: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.normal)),
      ),
      home: SplashView(),
    );
  }
}
