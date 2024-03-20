import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_final_graduation_project/core/utils/assets.dart';
import 'package:flutter_final_graduation_project/core/utils/colors.dart';
import 'package:flutter_final_graduation_project/core/utils/styles.dart';
import 'package:flutter_final_graduation_project/features/profile/presentation/views/widgets/custom_circle_avatar.dart';
import 'package:flutter_final_graduation_project/features/profile/presentation/views/widgets/custom_text_form_field.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

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
              CupertinoIcons.check_mark,
              color: BaseColors.blackColor,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
              Align(
                alignment: Alignment.topLeft,
                child: Text('Frist Name',
                    style: getRegularTextStyleInter(
                        fontSize: 18, color: BaseColors.blackColor)),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextFormField(),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text('Last Name',
                    style: getRegularTextStyleInter(
                        fontSize: 18, color: BaseColors.blackColor)),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(), 
            ],
          ),
        ),
      ),
    );
  }
}