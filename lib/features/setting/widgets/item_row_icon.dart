import 'package:flutter/cupertino.dart';
import 'package:flutter_final_graduation_project/core/utils/assets.dart';
import 'package:flutter_final_graduation_project/core/utils/colors.dart';
import 'package:flutter_final_graduation_project/core/utils/styles.dart';

class ItemRowIcon extends StatelessWidget {
  final IconData icon;
  final double sizeIcon;
  final String title;
  final Color color;
  final String value = '';
  const ItemRowIcon(
      {super.key,
      required this.icon,
      this.sizeIcon = 24,
      required this.title,
      this.color = BaseColors.primaryColor,
      required String value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: sizeIcon,
          color: color,
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          title,
          style: getRegularTextStylePoppins(
              color: BaseColors.primaryColor, fontSize: 14),
        ),
      ],
    );
  }
}
