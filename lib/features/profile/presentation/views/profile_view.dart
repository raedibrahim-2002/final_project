import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_graduation_project/core/utils/assets.dart';
import 'package:flutter_final_graduation_project/core/utils/colors.dart';
import 'package:flutter_final_graduation_project/core/utils/styles.dart';
import 'package:flutter_final_graduation_project/features/profile/cubit/user_cubit.dart';
import 'package:flutter_final_graduation_project/features/profile/presentation/views/edit_profile.dart';
import 'package:flutter_final_graduation_project/features/profile/presentation/views/widgets/custom_circle_avatar.dart';
import 'package:flutter_final_graduation_project/features/profile/presentation/views/widgets/decorated_item_profile.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit()..getUserData(),
      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<UserCubit>(context);
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
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
                  child: IconButton(
                    icon: const Icon(
                      CupertinoIcons.pen,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const EditProfileView();
                          },
                        ),
                      );
                    },
                    color: BaseColors.blackColor,
                  ),
                )
              ],
            ),
            body: cubit.userModel != null
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomCircleAvatar(
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
                                  .copyWith(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500)),
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
                          title: cubit.userModel!.name!,
                          icon: Icons.check,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text('Phone Number',
                            style: getRegularTextStyleInter(
                                fontSize: 18, color: BaseColors.blackColor)),
                        const SizedBox(
                          height: 15,
                        ),
                        DecoreaditemProfile(
                          title: cubit.userModel!.phone!,
                          icon: Icons.check,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text('email',
                            style: getRegularTextStyleInter(
                                fontSize: 18, color: BaseColors.blackColor)),
                        const SizedBox(
                          height: 15,
                        ),
                        DecoreaditemProfile(
                          title: cubit.userModel!.email!,
                          icon: CupertinoIcons.eye,
                        ),
                      ],
                    ),
                  )
                : const Center(
                    child: CupertinoActivityIndicator(),
                  ),
          );
        },
      ),
    );
  }
}
