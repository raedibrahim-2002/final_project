import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/core/utils/assets.dart';
import 'package:flutter_final_graduation_project/core/utils/colors.dart';
import 'package:flutter_final_graduation_project/core/utils/styles.dart';
import 'package:flutter_final_graduation_project/features/search/widgets/item_row_icon.dart';

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
            Icons.chevron_left,
            size: 34,
          ),
        ),
        title: Text(AssetsData.titleAppBarSearch,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Color(0XFF000000))),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AssetsData.generalText,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ItemRowIcon(
                  icon: CupertinoIcons.sun_min_fill,
                  title: AssetsData.theme,
                ),
                const Spacer(),
                SizedBox(
                  height: 24,
                  width: 35,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Switch(
                      activeColor: BaseColors.whiteColor,
                      activeTrackColor: BaseColors.switchActiveTrackColor,
                      inactiveThumbColor: BaseColors.switchActiveTrackColor,
                      inactiveTrackColor: BaseColors.whiteColor,
                      splashRadius: 50.0,
                      // boolean variable value
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ItemRowIcon(
                    icon: CupertinoIcons.globe, title: AssetsData.language),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    AssetsData.eng,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.chevron_right,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ItemRowIcon(
                    icon: CupertinoIcons.bell_fill,
                    title: AssetsData.notifications),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(CupertinoIcons.chevron_right),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              AssetsData.account,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ItemRowIcon(
                    icon: Icons.person,
                    sizeIcon: 30,
                    title: AssetsData.profile),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(CupertinoIcons.chevron_right),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              AssetsData.other,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ItemRowIcon(
                    icon: CupertinoIcons.lock_fill,
                    sizeIcon: 30,
                    title: AssetsData.privacyPolicy),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(CupertinoIcons.chevron_right),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ItemRowIcon(
                    icon: CupertinoIcons.info_circle_fill,
                    sizeIcon: 30,
                    title: AssetsData.aboutUs),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(CupertinoIcons.chevron_right),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
