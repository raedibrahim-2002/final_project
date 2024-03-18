import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/core/utils/assets.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AssetsStrings.ProfileString),
      ),
    );
  }
}
