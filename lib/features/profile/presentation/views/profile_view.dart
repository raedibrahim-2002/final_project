import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_final_graduation_project/core/utils/assets.dart';
import 'package:flutter_final_graduation_project/core/utils/colors.dart';
import 'package:flutter_final_graduation_project/core/utils/styles.dart';
import 'package:flutter_final_graduation_project/features/profile/presentation/views/widgets/custom_circleAvatar.dart';
import 'package:flutter_final_graduation_project/features/profile/presentation/views/widgets/decoread_item_profile.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          AppString.profile,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        leadingWidth: 48,
        actions: [
          CircleAvatar(
            radius: 40,
            backgroundColor: BaseColors.greyLight,
            child: Icon(
              CupertinoIcons.pen,
              color: BaseColors.blackColor,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCircleAvatar(
              image: AssetsData.profile,
            ),
            const SizedBox(
              height: 16,
            ),
            Align(
              alignment: Alignment.center,
              child: Text("Name",
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontSize: 24, fontWeight: FontWeight.w500)),
            ),
            const SizedBox(
              height: 50,
            ),
            Text('Frist Name',
                style: getRegularTextStyleInter(
                    fontSize: 18, color: BaseColors.blackColor)),
            const SizedBox(
              height: 15,
            ),
            DecoreaditemProfile(
              title: 'sara',
              icon: Icons.check,
            ),
            const SizedBox(
              height: 10,
            ),
            Text('Last Name',
                style: getRegularTextStyleInter(
                    fontSize: 18, color: BaseColors.blackColor)),
            const SizedBox(
              height: 15,
            ),
            DecoreaditemProfile(
              title: 'Hamdy',
              icon: Icons.check,
            ),
            const SizedBox(
              height: 10,
            ),
            Text('password',
                style: getRegularTextStyleInter(
                    fontSize: 18, color: BaseColors.blackColor)),
            const SizedBox(
              height: 15,
            ),
            DecoreaditemProfile(
              title: 'sara',
              icon: CupertinoIcons.eye,
            ),
          ],
        ),
      ),
    );
  }
}
