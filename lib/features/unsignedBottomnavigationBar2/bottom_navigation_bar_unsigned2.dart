import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/features/categories/presentation/views/category_view.dart';
import 'package:flutter_final_graduation_project/features/chat/presentation/views/chat_view.dart';
import 'package:flutter_final_graduation_project/features/home/presentation/views/home_view.dart';
import 'package:flutter_final_graduation_project/features/profile/presentation/views/profile_view.dart';
import 'package:flutter_final_graduation_project/features/unsignedBottomnavigationBar2/unSignedCategory.dart';
import 'package:flutter_final_graduation_project/features/unsignedBottomnavigationBar2/unSignedChat.dart';
import 'package:flutter_final_graduation_project/features/unsignedBottomnavigationBar2/unsigned_home.dart';

import '../../core/utils/shared_prefrences.dart';

class BottomNavigationBarHelperUnSigned2 extends StatefulWidget {
  const BottomNavigationBarHelperUnSigned2({super.key});
  @override
  State<BottomNavigationBarHelperUnSigned2> createState() =>
      _BottomNavigationBarHelperUnSigned2State();
}

class _BottomNavigationBarHelperUnSigned2State
    extends State<BottomNavigationBarHelperUnSigned2> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      UnSignedHomeView2(),
      UnSignedCategory(),
      UnSignedChat2(),
    ];
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: PreferenceUtils.getBool(PrefKeys.darkTheme)
                  ? Colors.white.withOpacity(0.3)
                  : Colors.black.withOpacity(0.4),
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, 3), // تغيير الاتجاه إذا لزم الأمر
            ),
          ],
        ),
        child: CurvedNavigationBar(
          color: PreferenceUtils.getBool(PrefKeys.darkTheme)
              ? Colors.black
              : Colors.white,
          backgroundColor: Colors.transparent,
          index: _selectedIndex,
          buttonBackgroundColor: PreferenceUtils.getBool(PrefKeys.darkTheme)
              ? Colors.white
              : Colors.black,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          animationDuration: Duration(milliseconds: 400),
          items: [
            Icon(
              Icons.home,
              color: _selectedIndex == 0
                  ? PreferenceUtils.getBool(PrefKeys.darkTheme)
                      ? Colors.black
                      : Colors.white
                  : PreferenceUtils.getBool(PrefKeys.darkTheme)
                      ? Colors.white
                      : Colors.black,
            ),
            Icon(
              Icons.category,
              color: _selectedIndex == 1
                  ? PreferenceUtils.getBool(PrefKeys.darkTheme)
                      ? Colors.black
                      : Colors.white
                  : PreferenceUtils.getBool(PrefKeys.darkTheme)
                      ? Colors.white
                      : Colors.black,
            ),
            Icon(
              Icons.chat,
              color: _selectedIndex == 2
                  ? PreferenceUtils.getBool(PrefKeys.darkTheme)
                      ? Colors.black
                      : Colors.white
                  : PreferenceUtils.getBool(PrefKeys.darkTheme)
                      ? Colors.white
                      : Colors.black,
            ),
          ],
        ),
      ),
      body: screens[_selectedIndex],
    );
  }
}
