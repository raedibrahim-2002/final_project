import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget { 
    final String title;

  const CustomTab({super.key, required this.title, });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(this.title),
      ),
    );
  }
}
