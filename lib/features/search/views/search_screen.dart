import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/core/utils/assets.dart';
import 'package:flutter_final_graduation_project/core/utils/colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leadingWidth: 48,
        leading: Padding(
          padding: EdgeInsets.only(
            left: 16,
            top: 12,
            bottom: 12,
          ),
          child: Icon(
            Icons.arrow_left_outlined,
            color: BaseColors.primaryColor,
            weight: 32,
            size: 32,
          ),
        ),
        title: Text(AssetsData.titleAppBarSearch,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Color(0XFF000000))),
      ),
    );
  }
}
