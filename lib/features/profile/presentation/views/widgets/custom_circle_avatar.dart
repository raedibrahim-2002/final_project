import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/core/utils/colors.dart';

class CustomCircleAvatar extends StatelessWidget {
  final String image;
  const CustomCircleAvatar({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: 70,
            backgroundColor: BaseColors.pinkLight,
            child: Image.asset(
              image,
              fit: BoxFit.fill,
              width: 100,
            ),
          ),
          CircleAvatar(
            backgroundColor: BaseColors.greyLight,
            radius: 22,
            child: Icon(
              CupertinoIcons.photo_camera,
              color: BaseColors.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}