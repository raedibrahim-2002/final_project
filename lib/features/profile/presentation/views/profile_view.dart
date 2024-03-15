import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_final_graduation_project/core/utils/assets.dart';
import 'package:flutter_final_graduation_project/core/utils/colors.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(AppString.profile),
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
            Align(
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: BaseColors.pinkLight,
                    child: Image.asset(
                      AssetsData.profile,
                      fit: BoxFit.fill,
                      width: 100,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: BaseColors.greyLight,
                    radius: 22,
                    child: Icon(
                      CupertinoIcons.photo_camera,
                      color: BaseColors.blackColor,
                    ),
                  ),
                ],
              ),
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
            Text('Last Name'),
          const SizedBox(
              height: 15,
            ),
            // TextFormField(
            //   decoration,
            // )
          ],
        ),
      ),
    );
  }
}
