import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/core/utils/colors.dart';

class SignupScreen extends StatelessWidget {
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
                  image: AssetImage("assets/images/create.png"),
                  height: MediaQuery.of(context).size.height * .2,
                  width: double.infinity,
                  alignment: Alignment.topCenter,
                ),
                Text(
                  "Create your account",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: BaseColors.blackColor),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  onFieldSubmitted: (String value) {
                    print(value);
                  },
                  onChanged: (String value) {
                    print(value);
                  },
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: Theme.of(context).textTheme.headlineMedium,
                    prefixIcon: Icon(
                      Icons.email,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  onFieldSubmitted: (String value) {
                    print(value);
                  },
                  onChanged: (String value) {
                    print(value);
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
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  onFieldSubmitted: (String value) {
                    print(value);
                  },
                  onChanged: (String value) {
                    print(value);
                  },
                  decoration: InputDecoration(
                    labelText: " Confirm Password",
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
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: () {
                      print(emailController.text);
                      print(passwordController.text);
                    },
                    child: Text(
                      "Sign up",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
