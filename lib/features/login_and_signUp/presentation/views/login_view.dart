import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/bottom_navigation_bar.dart';
import 'package:flutter_final_graduation_project/core/api/api_consumer.dart';
import 'package:flutter_final_graduation_project/core/utils/assets.dart';
import 'package:flutter_final_graduation_project/core/utils/colors.dart';
import 'package:flutter_final_graduation_project/core/utils/flutter_toast.dart';
import 'package:flutter_final_graduation_project/core/utils/shared_prefrences.dart';
import 'package:flutter_final_graduation_project/features/login_and_signUp/presentation/models/login_responce.dart';

import 'forget_password_view.dart';
import 'signUp_view.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> signInFormKey = GlobalKey();

  //Sign in email
  TextEditingController signInEmailController = TextEditingController();

  //Sign in password
  TextEditingController signInPasswordController = TextEditingController();

  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image(
                  image: AssetImage("assets/images/rafiki2.png"),
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
                  height: MediaQuery.of(context).size.height / 4.5,
                  width: double.infinity,
                  child: Form(
                    key: signInFormKey,
                    child: ListView(
                      children: [
                        TextFormField(
                          controller: signInEmailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter email!";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Email",
                            hintStyle:
                                Theme.of(context).textTheme.headlineMedium,
                            labelStyle:
                                Theme.of(context).textTheme.headlineMedium,
                            prefixIcon: Icon(
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
                          obscureText: obscure,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter password!";
                            }
                            return null;
                          },
                          controller: signInPasswordController,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle:
                                Theme.of(context).textTheme.headlineMedium,
                            prefixIcon: Icon(
                              Icons.lock,
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
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ],
                    ),
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
                  child: MaterialButton(
                    onPressed: () {
                      login();
                    },
                    child: Text(
                      "Sign in",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(fontSize: 18, color: BaseColors.whiteColor),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFF1D2046),
                    borderRadius: BorderRadius.circular(15),
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
                              return SignupScreen();
                            },
                          ),
                        );
                      },
                      child: Text("Sign up ",
                          style: Theme.of(context).textTheme.displaySmall),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> login() async {
    if (!signInFormKey.currentState!.validate()) {
      return;
    }
    final response = await AppDio.post(
      endPoint: EndPoints.login,
      body: {
        'email': signInEmailController.text,
        'password': signInPasswordController.text,
      },
    );
    print(response);
    final loginResponse = LoginResponse.fromJson(response.data);
    if (loginResponse.status) {
      PreferenceUtils.setString(PrefKeys.apiToken, loginResponse.data.token);
      PreferenceUtils.setString(PrefKeys.userName, loginResponse.data.name);
      PreferenceUtils.setString(PrefKeys.userEmail, loginResponse.data.email);
      navToHome();
    } else {
      showToast(loginResponse.message);
    }
  }

  void navToRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignupScreen(),
      ),
    );
  }

  void navToHome() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const BottomNavigationBarHelper(),
      ),
      (route) => false,
    );
  }
}
