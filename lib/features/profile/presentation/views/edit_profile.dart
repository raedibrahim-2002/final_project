import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_graduation_project/core/utils/assets.dart';
import 'package:flutter_final_graduation_project/core/utils/colors.dart';
import 'package:flutter_final_graduation_project/core/utils/styles.dart';
import 'package:flutter_final_graduation_project/features/profile/presentation/views/widgets/custom_circle_avatar.dart';
import 'package:flutter_final_graduation_project/features/profile/presentation/views/widgets/custom_text_form_field.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../cubit/user_cubit.dart';

class EditProfileView extends StatelessWidget {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<UserCubit>(context);
    nameController.text = cubit.userModel!.name!;
    phoneController.text = cubit.userModel!.phone!;
    emailController.text = cubit.userModel!.email!;
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
              child: BlocConsumer<UserCubit, UserState>(
                listener: (context, state) {
                  if (state is UpdateUserDataSuccessState) {
                    showSnackBarIteam(
                        context, 'Data Updated Successfully', true);
                    Navigator.pop(context);
                  } else if (state is UpdateUserDataWithFailureState) {
                    showSnackBarIteam(context, state.error, true);
                  }
                },
                builder: (context, state) {
                  return IconButton(
                    onPressed: () {
                      // كود تفعيل التعديلات
                      if (nameController.text.isNotEmpty &&
                          phoneController.text.isNotEmpty &&
                          emailController.text.isNotEmpty) {
                        cubit.updateUserData(
                            name: nameController.text,
                            phone: phoneController.text,
                            email: emailController.text);
                      } else {
                        showSnackBarIteam(
                            context, 'please, Enter All Data !', false);
                      }
                    },
                    icon: Icon(
                      CupertinoIcons.check_mark,
                      color: BaseColors.blackColor,
                    ),
                  );
                },
              ))
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
                child: Text('User Name',
                    style: getRegularTextStyleInter(
                        fontSize: 18, color: BaseColors.blackColor)),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextFormField(
                controller: nameController,
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text('Phone',
                    style: getRegularTextStyleInter(
                        fontSize: 18, color: BaseColors.blackColor)),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                controller: phoneController,
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text('email',
                    style: getRegularTextStyleInter(
                        fontSize: 18, color: BaseColors.blackColor)),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                controller: emailController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showSnackBarIteam(
    BuildContext context, String message, bool forSuccessOrFailure) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: forSuccessOrFailure ? Colors.green : Colors.red,
  ));
}
