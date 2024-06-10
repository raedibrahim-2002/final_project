import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_graduation_project/core/utils/assets.dart';
import 'package:flutter_final_graduation_project/core/utils/colors.dart';
import 'package:flutter_final_graduation_project/core/utils/shared_prefrences.dart';
import 'package:flutter_final_graduation_project/core/utils/styles.dart';
import 'package:flutter_final_graduation_project/features/profile/presentation/views/widgets/custom_circle_avatar.dart';
import 'package:flutter_final_graduation_project/features/profile/presentation/views/widgets/custom_text_form_field.dart';
import 'package:get/get.dart';
import '../../cubit/user_cubit.dart';

class EditProfileView extends StatelessWidget {
  EditProfileView({super.key});

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit()..getUserData(),
      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is UpdateUserDataSuccessState) {
            showSnackBarItem(context, "User data updated successfully", true);
            Navigator.pop(context);
          } else if (state is UpdateUserDataWithFailureState) {
            showSnackBarItem(context, state.error, false);
          }
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<UserCubit>(context);

          if (state is GetUserDataLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (cubit.userModel != null) {
            nameController.text = cubit.userModel!.name!;
            phoneController.text = cubit.userModel!.phone!;
            emailController.text = cubit.userModel!.email!;
          }

          return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              centerTitle: true,
              title: Text(
                '10'.tr,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              leadingWidth: 48,
              actions: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: BaseColors.greyLight,
                  child: IconButton(
                    onPressed: () {
                      if (nameController.text.isNotEmpty &&
                          phoneController.text.isNotEmpty &&
                          emailController.text.isNotEmpty) {
                        cubit.updateUserData(
                          name: nameController.text,
                          phone: phoneController.text,
                          email: emailController.text,
                        );
                      } else {
                        showSnackBarItem(context, '38'.tr, false);
                      }
                    },
                    icon: const Icon(
                      CupertinoIcons.check_mark,
                      color: BaseColors.blackColor,
                    ),
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "39".tr,
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    buildTextFieldSection(
                      context,
                      label: '40'.tr,
                      controller: nameController,
                    ),
                    buildTextFieldSection(
                      context,
                      label: '29'.tr,
                      controller: phoneController,
                    ),
                    buildTextFieldSection(
                      context,
                      label: '30'.tr,
                      controller: emailController,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildTextFieldSection(
    BuildContext context, {
    required String label,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: getRegularTextStyleInter(
            fontSize: 20,
            color: PreferenceUtils.getBool(PrefKeys.darkTheme)
                ? BaseColors.whiteColor
                : Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        CustomTextFormField(controller: controller),
        const SizedBox(height: 10),
      ],
    );
  }
}

void showSnackBarItem(
    BuildContext context, String message, bool forSuccessOrFailure) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: forSuccessOrFailure ? Colors.green : Colors.red,
  ));
}
