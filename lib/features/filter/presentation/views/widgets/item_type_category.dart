import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/core/utils/colors.dart';
import 'package:flutter_final_graduation_project/core/utils/styles.dart';

class ItemTypecategory extends StatefulWidget {
  final String title;
  final Color color;
  final VoidCallback onTap;
  const ItemTypecategory({
    super.key,
    required this.onTap,
    required this.title,
    required this.color,
  });

  @override
  State<ItemTypecategory> createState() => _ItemTypecategoryState();
}

class _ItemTypecategoryState extends State<ItemTypecategory> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      
      child: Container(
        padding: EdgeInsets.all(8),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(5), color: widget.color),
        child: Text(
          widget.title,
          style: getRegularTextStyleInter(
              color: BaseColors.whiteColor, fontSize: 16),
        ),
      ),
    );
  }
}
