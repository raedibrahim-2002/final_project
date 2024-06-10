import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_graduation_project/core/local/local_controller.dart';
import 'package:flutter_final_graduation_project/core/utils/about_us.dart';
import 'package:flutter_final_graduation_project/core/utils/assets.dart';
import 'package:flutter_final_graduation_project/core/utils/colors.dart';
import 'package:flutter_final_graduation_project/core/utils/shared_prefrences.dart';
import 'package:flutter_final_graduation_project/core/utils/styles.dart';
import 'package:flutter_final_graduation_project/features/home/presentation/views/notifications_view.dart';
import 'package:flutter_final_graduation_project/features/profile/presentation/views/profile_view.dart';
import 'package:flutter_final_graduation_project/features/setting/cubit/setting_cubit.dart';
import 'package:flutter_final_graduation_project/features/setting/widgets/item_row_icon.dart';
import 'package:get/get.dart';

class UnSignedSettingsScreen extends StatefulWidget {
  const UnSignedSettingsScreen({super.key});

  @override
  State<UnSignedSettingsScreen> createState() => _UnSignedSettingsScreenState();
}

class _UnSignedSettingsScreenState extends State<UnSignedSettingsScreen> {
  @override
  MyLocalController controllerLang = Get.find();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "3".tr,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: PreferenceUtils.getBool(PrefKeys.darkTheme)
                    ? Colors.white
                    : Colors.black,
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
              "7".tr,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: () {
                showBottomSheetTheme();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ItemRowIcon(
                    icon: CupertinoIcons.sun_min_fill,
                    title: "5".tr,
                    value: '',
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 24,
                    width: 35,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Text(PreferenceUtils.getBool(PrefKeys.darkTheme)
                          ? 'dark'.tr
                          : 'light'.tr),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: () {
                showBottomSheetLanguag();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ItemRowIcon(
                    value: PreferenceUtils.getString(PrefKeys.language, 'en'),
                    icon: CupertinoIcons.globe,
                    title: "4".tr,
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 20,
                    width: 30,
                    child: FittedBox(
                        fit: BoxFit.fill,
                        child: Text(
                          PreferenceUtils.getString(PrefKeys.language),
                        )),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              "11".tr,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return AboutUsPage();
                  },
                ));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ItemRowIcon(
                    icon: CupertinoIcons.info_circle_fill,
                    sizeIcon: 30,
                    title: "13".tr,
                    value: '',
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return AboutUsPage();
                        },
                      ));
                    },
                    icon: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showBottomSheetTheme() {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return Container(
          height: 200,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Select Theme'.tr,
                  style: TextStyle(
                      color: PreferenceUtils.getBool(PrefKeys.darkTheme)
                          ? BaseColors.whiteColor
                          : BaseColors.blackColor,
                      fontSize: 22),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await PreferenceUtils.setBool(PrefKeys.darkTheme, false);
                    Navigator.pop(context);
                  },
                  child: Text('light'.tr,
                      style: TextStyle(
                        color: PreferenceUtils.getBool(PrefKeys.darkTheme)
                            ? BaseColors.whiteColor
                            : BaseColors.blackColor,
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await PreferenceUtils.setBool(PrefKeys.darkTheme, true);
                    Navigator.pop(context);
                  },
                  child: Text('dark'.tr,
                      style: TextStyle(
                        color: PreferenceUtils.getBool(PrefKeys.darkTheme)
                            ? BaseColors.whiteColor
                            : BaseColors.blackColor,
                      )),
                ),
              ],
            ),
          ),
        );
      },
    ).then((value) {
      BlocProvider.of<SettingCubit>(context).chageTheme();
    });
  }

  void showBottomSheetLanguag() {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return Container(
          height: 200,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text('Select Language'.tr,
                    style: TextStyle(
                        color: PreferenceUtils.getBool(PrefKeys.darkTheme)
                            ? BaseColors.whiteColor
                            : BaseColors.blackColor,
                        fontSize: 22)),
                ElevatedButton(
                  onPressed: () async {
                    controllerLang.changeLang("en");
                    Navigator.pop(context);
                  },
                  child: Text('6'.tr,
                      style: TextStyle(
                        color: PreferenceUtils.getBool(PrefKeys.darkTheme)
                            ? BaseColors.whiteColor
                            : BaseColors.blackColor,
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    controllerLang.changeLang("ar");

                    Navigator.pop(context);
                  },
                  child: Text('20'.tr,
                      style: TextStyle(
                        color: PreferenceUtils.getBool(PrefKeys.darkTheme)
                            ? BaseColors.whiteColor
                            : BaseColors.blackColor,
                      )),
                ),
              ],
            ),
          ),
        );
      },
    ).then((value) {
      BlocProvider.of<SettingCubit>(context).chageLanguage();
    });
  }
}
