import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/bottom_navigation_bar.dart';
import 'package:flutter_final_graduation_project/features/splash/presentation/view/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewBody(),
    );
  }
}
