import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_final_graduation_project/core/utils/assets.dart';
import 'package:flutter_final_graduation_project/core/utils/colors.dart';
import 'package:flutter_final_graduation_project/core/utils/shared_prefrences.dart';
import 'package:flutter_final_graduation_project/core/utils/styles.dart';
import 'package:flutter_final_graduation_project/features/setting/widgets/item_row_icon.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          AppString.titleAppBarSettings,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Color(0XFF000000),
              ),
        ),
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
              AppString.generalText,
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
                  title: AppString.theme,
                  value: '',
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
            GestureDetector(
              onTap: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 200,
                      decoration: BoxDecoration(),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            const SizedBox(
                              height: 20,
                            ),
                            const Text('Select Language'),
                            InkWell(
                              onTap: () async {
                                await PreferenceUtils.setString(
                                  PrefKeys.language,
                                  'En',
                                );
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(10),
                                child: const Text(
                                  'En',
                                  style: TextStyle(
                                    fontSize: 22,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: () async {
                                await PreferenceUtils.setString(
                                  PrefKeys.language,
                                  'Ar',
                                );
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(10),
                                child: const Text(
                                  'Ar',
                                  style: TextStyle(
                                    fontSize: 22,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ItemRowIcon(
                      value: PreferenceUtils.getString(PrefKeys.language, 'En'),
                      icon: CupertinoIcons.globe,
                      title: AppString.language),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      AppString.eng,
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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ItemRowIcon(
                  icon: CupertinoIcons.bell_fill,
                  title: AppString.notifications,
                  value: '',
                ),
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
              AppString.account,
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
                  title: AppString.profile,
                  value: '',
                ),
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
              AppString.other,
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
                  title: AppString.privacyPolicy,
                  value: '',
                ),
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
                  title: AppString.aboutUs,
                  value: '',
                ),
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
