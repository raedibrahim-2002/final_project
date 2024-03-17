import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/features/Details/views/Details_screen.dart';
import 'package:flutter_final_graduation_project/features/Language/views/language_screen.dart';
import 'package:flutter_final_graduation_project/features/Login/views/Forget_password_Screen.dart';
import 'package:flutter_final_graduation_project/features/Login/views/Get_code_screen.dart';
import 'package:flutter_final_graduation_project/features/Login/views/Login_Screen.dart';
import 'package:flutter_final_graduation_project/features/Login/views/Sign_up_Screen.dart';
import 'package:flutter_final_graduation_project/features/Search/views/Search_Screen.dart';
import 'package:flutter_final_graduation_project/features/splash/presentation/view/splash_view.dart';
import 'package:get/get.dart';

import 'features/chat/presentation/views/chat_Screen.dart';
import 'features/home/presentation/views/home_view.dart';

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
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.normal),
          headlineSmall: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal),
        ),
      ),
      home: SplashView(),
    );
  }
}
