import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/core/utils/colors.dart';
import 'package:flutter_final_graduation_project/core/utils/styles.dart';

class DecoreaditemProfile extends StatelessWidget {
  final String title;
  final IconData icon;
  const DecoreaditemProfile({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: BaseColors.greyLight,
      ),
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: getRegularTextStyleInter(
                    fontSize: 15, color: BaseColors.subTitle),
              ),
              Icon(icon, color: Colors.blue, size: 16)
            ],
          ),
        ),
      ),
    );
  }
}