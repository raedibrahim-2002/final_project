import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_graduation_project/bottom_navigation_bar.dart';
import 'package:flutter_final_graduation_project/core/utils/assets.dart';
import 'package:flutter_final_graduation_project/core/utils/colors.dart';
import 'package:flutter_final_graduation_project/features/home/presentation/views/home_view.dart';
import 'package:flutter_final_graduation_project/features/login_and_signUp/presentation/views/auth_cubit/auth_cubit.dart';
import 'package:flutter_final_graduation_project/features/login_and_signUp/presentation/views/auth_cubit/auth_states.dart';
import 'package:flutter_final_graduation_project/features/unsignedBottomnavigationBar2/bottom_navigation_bar_unsigned2.dart';

import 'forget_password_view.dart';
import 'signUp_view.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  //Sign in email
  TextEditingController emailController = TextEditingController();

  //Sign in password
  TextEditingController passwordController = TextEditingController();

  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocConsumer<AuthCubit, AuthStates>(
          listener: (context, state) {
            if (state is LoginSuccessState) {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BottomNavigationBarHelper()));
            }
            if (state is FailedToLoginState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Container(
                alignment: Alignment.center,
                height: 50,
                child: Text(state.message),
              )));
            }
          },
          builder: (context, state) {
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Image(
                              image:
                                  const AssetImage("assets/images/rafiki2.png"),
                              height: MediaQuery.of(context).size.height * .2,
                              width: double.infinity,
                              alignment: Alignment.topCenter,
                            ),
                            Text(
                              "Login to your account",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: BaseColors.blackColor),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 6,
                              width: double.infinity,
                              child: ListView(
                                children: [
                                  TextFormField(
                                    controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (input) {
                                      if (emailController.text.isEmpty) {
                                        return "Please enter email!";
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(
                                      labelText: "Email",
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .headlineMedium,
                                      labelStyle: Theme.of(context)
                                          .textTheme
                                          .headlineMedium,
                                      prefixIcon: const Icon(
                                        Icons.email,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    obscureText: obscure,
                                    validator: (input) {
                                      if (passwordController.text.isEmpty) {
                                        return "Please enter password!";
                                      } else {
                                        return null;
                                      }
                                    },
                                    controller: passwordController,
                                    keyboardType: TextInputType.visiblePassword,
                                    decoration: InputDecoration(
                                      labelText: "Password",
                                      labelStyle: Theme.of(context)
                                          .textTheme
                                          .headlineMedium,
                                      prefixIcon: const Icon(
                                        Icons.password,
                                      ),
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          obscure = !obscure;
                                          setState(() {});
                                        },
                                        icon: Icon(
                                          obscure == true
                                              ? Icons.visibility_off_outlined
                                              : Icons.visibility_outlined,
                                          color: BaseColors.primaryColor,
                                        ),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return ForgetPasswordView();
                                        },
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Forget password ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: BaseColors.blackColor),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xFF1D2046),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: MaterialButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate() ==
                                      true) {
                                    BlocProvider.of<AuthCubit>(context).login(
                                        email: emailController.text,
                                        password: passwordController.text);
                                  }
                                },
                                child: Text(
                                  state is LoginLoadingState
                                      ? "Loading..."
                                      : "Sign in",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                          fontSize: 18,
                                          color: BaseColors.whiteColor),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xFF1D2046),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: MaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const BottomNavigationBarHelperUnSigned2();
                                      },
                                    ),
                                  );
                                },
                                child: Text(
                                  OnBoardingAssets.continueAsGuestButton,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                          fontSize: 18,
                                          color: BaseColors.whiteColor),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don\'t have an account?",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(color: BaseColors.grey),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return const SignupScreen();
                                        },
                                      ),
                                    );
                                  },
                                  child: Text("Sign up ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
