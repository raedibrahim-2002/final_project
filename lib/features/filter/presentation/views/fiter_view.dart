import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_final_graduation_project/core/utils/assets.dart';
import 'package:flutter_final_graduation_project/core/utils/colors.dart';
import 'package:flutter_final_graduation_project/core/utils/styles.dart';
import 'package:flutter_final_graduation_project/features/categories/presentation/views/category_view.dart';
import 'package:flutter_final_graduation_project/features/filter/presentation/views/widgets/elevated_button.dart';
import 'package:flutter_final_graduation_project/features/filter/presentation/views/widgets/item_type_category.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Filter',
          style: getMediumTextStyleInter(
            color: BaseColors.blackColor,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  AppString.category,
                  style: getMediumTextStyleInter(
                    color: BaseColors.blackColor,
                    fontSize: 20,
                  ),
                ),
                Spacer(),
                Text(
                  'View all',
                  style: getMediumTextStyleInter(
                    color: BaseColors.blackColor,
                    fontSize: 15,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CategoryView();
                        },
                      ),
                    );
                  },
                  icon: Icon(CupertinoIcons.chevron_right),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Divider(
                color: BaseColors.grey,
              ),
            ),
            Text('Type'),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ItemTypecategory(
                    onTap: () {},
                    title: AppString.bedroom,
                    color: BaseColors.primaryColor,
                  ),
                  ItemTypecategory(
                    onTap: () {},
                    title: AppString.livingRoom,
                    color: BaseColors.primaryColor,
                  ),
                  ItemTypecategory(
                    onTap: () {},
                    title: AppString.bathroom,
                    color: BaseColors.primaryColor,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ItemTypecategory(
                    onTap: () {},
                    title: AppString.Kitchen,
                    color: BaseColors.primaryColor,
                  ),
                  ItemTypecategory(
                    onTap: () {},
                    title: AppString.receptions,
                    color: BaseColors.primaryColor,
                  ),
                  ItemTypecategory(
                    onTap: () {},
                    title: AppString.diningRoom,
                    color: BaseColors.primaryColor,
                  ),
                ],
              ),
            ),
            const Spacer(),
            ElevatedButtonItem(
              title: 'Apply',
              color: BaseColors.whiteColor,
              onTap: () {},
              colorButton: BaseColors.primaryColor,
            ),
            ElevatedButtonItem(
              colorBorderSide: BaseColors.primaryColor,
              title: 'Reset',
              color: BaseColors.primaryColor,
              onTap: () {},
              colorButton: BaseColors.whiteColor,
            ),
          ],
        ),
      ),
    );
  }
}
