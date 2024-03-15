import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/core/utils/theme.dart';
import 'package:flutter_final_graduation_project/features/profile/presentation/views/profile_view.dart';
import 'package:flutter_final_graduation_project/features/search/views/search_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getAppTheme(),
      home: ProfileView(),
    );
  }
}
