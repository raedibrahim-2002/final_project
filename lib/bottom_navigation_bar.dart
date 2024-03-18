import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/features/categories/presentation/views/category_view.dart';
import 'package:flutter_final_graduation_project/features/chat/presentation/views/chat_view.dart';
import 'package:flutter_final_graduation_project/features/home/presentation/views/home_view.dart';
import 'package:flutter_final_graduation_project/features/profile/presentation/views/profile_view.dart';

class BottomNavigationBarHelper extends StatefulWidget {
  const BottomNavigationBarHelper({super.key});
  @override
  State<BottomNavigationBarHelper> createState() =>
      _BottomNavigationBarHelperState();
}

class _BottomNavigationBarHelperState extends State<BottomNavigationBarHelper> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      HomeView(),
      CategoryView(),
      ChatView(),
      ProfileView(),
    ];
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.white, // لون خلفية ال bottom navigation bar
        backgroundColor: Colors.transparent,
        index: _selectedIndex,
        buttonBackgroundColor: Colors.black,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        animationDuration: Duration(milliseconds: 400),
        items: [
          Icon(
            Icons.home,
            color: _selectedIndex == 0 ? Colors.white : Colors.black,
          ), // اللون يتغير بناءً على الاختيار المحدد
          Icon(Icons.category,
              color: _selectedIndex == 1 ? Colors.white : Colors.black),
          Icon(Icons.chat,
              color: _selectedIndex == 2 ? Colors.white : Colors.black),
          Icon(Icons.person,
              color: _selectedIndex == 3 ? Colors.white : Colors.black),
        ],
      ),
      body: screens[_selectedIndex],
    );
  }
}
