import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/core/utils/colors.dart';
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
        iconTheme: IconThemeData(color: Colors.black, size: 28,),
        appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Colors.black), color: Colors.white),
        textTheme: TextTheme(
          displayLarge: TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          headlineLarge: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      home: SplashView(),
    );
  }
}
