import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/bottom_navigation_bar.dart';
import 'package:flutter_final_graduation_project/core/utils/colors.dart';
import 'package:flutter_final_graduation_project/features/login_and_signUp/views/forget_password_view.dart';
import 'package:flutter_final_graduation_project/features/login_and_signUp/views/signUp_view.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

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
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: (String value) {
                      // print(value);
                    },
                    onChanged: (String value) {
                      // print(value);
                    },
                    decoration: InputDecoration(
                      labelText: "Email",
                      hintStyle: Theme.of(context).textTheme.headlineMedium,
                      labelStyle: Theme.of(context).textTheme.headlineMedium,
                      prefixIcon: Icon(
                        Icons.email,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    onFieldSubmitted: (String value) {
                      // print(value);
                    },
                    onChanged: (String value) {
                      // print(value);
                    },
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: Theme.of(context).textTheme.headlineMedium,
                      prefixIcon: Icon(
                        Icons.lock,
                      ),
                      suffixIcon: Icon(
                        Icons.remove_red_eye,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    style: Theme.of(context).textTheme.headlineMedium,
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
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return BottomNavigationBarHelper();
                          },
                        ),
                      );
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
}
