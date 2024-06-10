import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_graduation_project/bottom_navigation_bar.dart';

import 'package:flutter_final_graduation_project/core/utils/assets.dart';
import 'package:flutter_final_graduation_project/core/utils/colors.dart';
import 'package:flutter_final_graduation_project/core/utils/flutter_toast.dart';
import 'package:flutter_final_graduation_project/features/home/presentation/views/home_view.dart';
import 'package:flutter_final_graduation_project/features/login_and_signUp/presentation/views/auth_cubit/auth_cubit.dart';
import 'package:flutter_final_graduation_project/features/login_and_signUp/presentation/views/auth_cubit/auth_states.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool obscure1 = true;
  bool obscure2 = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const BottomNavigationBarHelper()));
        } else if (state is FailedToRegisterState) {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    content: Text(
                      state.message,
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.redAccent,
                  ));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Image(
                        image: const AssetImage("assets/images/create.png"),
                        height: MediaQuery.of(context).size.height * .2,
                        width: double.infinity,
                        alignment: Alignment.topCenter,
                      ),
                      Text(
                        "Create your account".tr,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: BaseColors.blackColor),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 1.7,
                        width: double.infinity,
                        color: BaseColors.whiteColor,
                        child: ListView(
                          children: [
                            TextFormField(
                              controller: nameController,
                              keyboardType: TextInputType.name,
                              validator: (input) {
                                if (nameController.text.isEmpty) {
                                  return "Please enter name!".tr;
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                labelText: "37".tr,
                                hintStyle:
                                    Theme.of(context).textTheme.headlineMedium,
                                labelStyle:
                                    Theme.of(context).textTheme.headlineMedium,
                                prefixIcon: const Icon(
                                  Icons.person,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (input) {
                                if (emailController.text.isEmpty) {
                                  return "Please enter email!".tr;
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                labelText: "30".tr,
                                labelStyle:
                                    Theme.of(context).textTheme.headlineMedium,
                                prefixIcon: const Icon(
                                  Icons.email,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: passwordController,
                              validator: (input) {
                                if (passwordController.text.isEmpty) {
                                  return "Please enter password!".tr;
                                } else {
                                  return null;
                                }
                              },
                              obscureText: obscure1,
                              decoration: InputDecoration(
                                labelText: "Password".tr,
                                labelStyle:
                                    Theme.of(context).textTheme.headlineMedium,
                                prefixIcon: const Icon(
                                  Icons.password,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    obscure1 = !obscure1;
                                    setState(() {});
                                  },
                                  icon: Icon(
                                    obscure1 == true
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined,
                                    color: BaseColors.primaryColor,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: phoneController,
                              keyboardType: TextInputType.phone,
                              validator: (input) {
                                if (phoneController.text.isEmpty) {
                                  return "Please enter phone!".tr;
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                labelText: "29".tr,
                                hintStyle:
                                    Theme.of(context).textTheme.headlineMedium,
                                labelStyle:
                                    Theme.of(context).textTheme.headlineMedium,
                                prefixIcon: const Icon(
                                  Icons.phone,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xFF1D2046),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: MaterialButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    //register
                                    BlocProvider.of<AuthCubit>(context)
                                        .register(
                                            name: nameController.text,
                                            email: emailController.text,
                                            phone: phoneController.text,
                                            password: passwordController.text);
                                  }
                                },
                                child: Text(
                                  state is RegisterLoadingState
                                      ? "Loading...".tr
                                      : "Sign up".tr,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                          fontSize: 18,
                                          color: BaseColors.whiteColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
