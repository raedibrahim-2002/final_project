import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_graduation_project/core/utils/assets.dart';
import 'package:flutter_final_graduation_project/core/utils/colors.dart';
import 'package:flutter_final_graduation_project/core/utils/shared_prefrences.dart';
import 'package:flutter_final_graduation_project/core/utils/styles.dart';
import 'package:flutter_final_graduation_project/features/home/presentation/views/notifications_view.dart';
import 'package:flutter_final_graduation_project/features/profile/presentation/views/profile_view.dart';
import 'package:flutter_final_graduation_project/features/setting/bloc/swicth_bloc.dart';
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
                    child: BlocBuilder<SwicthBloc, SwicthState>(
                      builder: (context, state) {
                        return Switch(
                          activeColor: BaseColors.whiteColor,
                          activeTrackColor: BaseColors.switchActiveTrackColor,
                          inactiveThumbColor: BaseColors.switchActiveTrackColor,
                          inactiveTrackColor: BaseColors.whiteColor,
                          splashRadius: 50.0,
                          // boolean variable value
                          value: state.switchValue,
                          onChanged: (newValue) {
                            newValue
                                ? context
                                    .read<SwicthBloc>()
                                    .add(switchOnEvent())
                                : context
                                    .read<SwicthBloc>()
                                    .add(switchOffEvent());
                          },
                        );
                      },
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
                            const Text(
                              'Select Language',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                await PreferenceUtils.setString(
                                  PrefKeys.language,
                                  'en',
                                );
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(10),
                                child: const Text(
                                  'en',
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
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
                                  'ar',
                                );
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(10),
                                child: const Text(
                                  'ar',
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ).then((value) {
                  Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ItemRowIcon(
                      value: PreferenceUtils.getString(PrefKeys.language, 'en'),
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
                    onPressed: () {
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
                                  const Text(
                                    'Select Language',
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.black,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      await PreferenceUtils.setString(
                                        PrefKeys.language,
                                        'en',
                                      );
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.all(10),
                                      child: const Text(
                                        'en',
                                        style: TextStyle(
                                          fontSize: 25,
                                          color: Colors.black,
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
                                        'ar',
                                      );
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.all(10),
                                      child: const Text(
                                        'ar',
                                        style: TextStyle(
                                          fontSize: 25,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ).then((value) {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/', (_) => false);
                      });
                    },
                    icon: Icon(Icons.arrow_forward_ios),
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return NotificationView();
                        },
                      ),
                    );
                  },
                  icon: Icon(Icons.arrow_forward_ios),
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ProfileView();
                        },
                      ),
                    );
                  },
                  icon: Icon(Icons.arrow_forward_ios),
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
                  icon: Icon(Icons.arrow_forward_ios),
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
                  icon: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
