import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_graduation_project/core/utils/assets.dart';
import 'package:flutter_final_graduation_project/core/utils/colors.dart';
import 'package:flutter_final_graduation_project/core/utils/constans.dart';
import 'package:flutter_final_graduation_project/core/utils/styles.dart';
import 'package:flutter_final_graduation_project/features/profile/cubit/user_cubit.dart';
import 'package:flutter_final_graduation_project/features/profile/presentation/views/widgets/custom_circle_avatar.dart';
import 'package:flutter_final_graduation_project/features/profile/presentation/views/widgets/custom_text_form_field.dart';
import 'package:flutter_final_graduation_project/generated/intl/messages_ar.dart';
import 'package:flutter_final_graduation_project/generated/l10n.dart';
import 'package:get/get.dart';

class ChangePasswordScreen extends StatelessWidget {
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<UserCubit>(context);
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is ChangePasswordSuccessState) {
          showSnackBarItem(context, "password updated successfully", true);
          Navigator.pop(context);
        }
        if (state is ChangePasswordWithFailureState) {
          showSnackBarItem(context, state.error, false);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            centerTitle: true,
            title: Text(
              S().profile,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: currentPasswordController,
                    style: Theme.of(context).textTheme.headlineMedium,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: "Current Password".tr,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: newPasswordController,
                    style: Theme.of(context).textTheme.headlineMedium,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "New Password".tr,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFF1D2046),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        if (currentPasswordController.text.trim() ==
                            currentPassword) {
                          if (newPasswordController.text.length >= 6) {
                            cubit.changePassword(
                              userCurrentPassword: currentPassword!,
                              newPassword: newPasswordController.text.trim(),
                            );
                          } else {
                            showSnackBarItem(
                                context,
                                "password must be at least 6 characters".tr,
                                false);
                          }
                        } else {
                          showSnackBarItem(
                              context,
                              "please, verify current password ,try again later"
                                  .tr,
                              false);
                        }
                      },
                      child: Text(
                        state is ChangePasswordLoadingState
                            ? "Loading...".tr
                            : "Update".tr,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                                fontSize: 18, color: BaseColors.whiteColor),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void showSnackBarItem(
      BuildContext context, String message, bool forSuccessOrFailure) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: forSuccessOrFailure ? Colors.green : Colors.red,
    ));
  }
}
