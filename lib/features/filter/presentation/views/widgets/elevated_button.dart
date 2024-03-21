import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/core/utils/styles.dart';

class ElevatedButtonItem extends StatelessWidget {
  final String title;
  final Color color;
  final Color colorButton;
  final VoidCallback onTap;
  final Color? colorBorderSide;
  const ElevatedButtonItem(
      {super.key,
      required this.title,
      required this.color,
      required this.colorButton,
      required this.onTap,
      this.colorBorderSide});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: colorButton,
              // padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              side: BorderSide(color: colorBorderSide ?? colorButton)),
          onPressed: onTap,
          child: Text(
            title,
            style: getMediumTextStyleInter(color: color, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
