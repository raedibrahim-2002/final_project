import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_final_graduation_project/core/utils/colors.dart';
import 'package:flutter_final_graduation_project/core/utils/shared_prefrences.dart';
import 'package:flutter_final_graduation_project/core/utils/styles.dart';

class ItemRowIcon extends StatelessWidget {
  final IconData icon;
  final double sizeIcon;
  final String title;

  final String value = '';
  const ItemRowIcon(
      {super.key,
      required this.icon,
      this.sizeIcon = 24,
      required this.title,
    
      required String value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: sizeIcon,
          color: PreferenceUtils.getBool(PrefKeys.darkTheme)
                  ? BaseColors.whiteColor
                  : BaseColors.primaryColor,
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          title,
          style: getRegularTextStylePoppins(
              color: PreferenceUtils.getBool(PrefKeys.darkTheme)
                  ? BaseColors.whiteColor
                  : BaseColors.primaryColor,
              fontSize: 14),
        ),
      ],
    );
  }
}