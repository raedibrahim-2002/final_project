import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/core/api/api_consumer.dart';
import 'package:flutter_final_graduation_project/core/utils/assets.dart';
import 'package:flutter_final_graduation_project/core/utils/colors.dart';
import 'package:flutter_final_graduation_project/core/utils/flutter_toast.dart';

import '../models/register_responce.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var signUpEmailController = TextEditingController();
  var signUpPasswordController = TextEditingController();
  var signUpNameController = TextEditingController();
  var signUpPhoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool obscure1 = true;
  bool obscure2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
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
                  Container(
                    height: MediaQuery.of(context).size.height / 1.7,
                    width: double.infinity,
                    color: BaseColors.whiteColor,
                    child: Form(
                        key: formKey,
                        child: ListView(
                          children: [
                            TextFormField(
                              controller: signUpNameController,
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter name!";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: "Name",
                                hintStyle:
                                    Theme.of(context).textTheme.headlineMedium,
                                labelStyle:
                                    Theme.of(context).textTheme.headlineMedium,
                                prefixIcon: Icon(
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
                              controller: signUpEmailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: "Email",
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
                              controller: signUpPasswordController,
                              obscureText: obscure1,
                              decoration: InputDecoration(
                                labelText: "Password",
                                labelStyle:
                                    Theme.of(context).textTheme.headlineMedium,
                                prefixIcon: Icon(
                                  Icons.lock,
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
                              controller: signUpPhoneController,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: obscure2,
                              decoration: InputDecoration(
                                labelText: "Phone",
                                labelStyle:
                                    Theme.of(context).textTheme.headlineMedium,
                                prefixIcon: Icon(
                                  Icons.lock,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    obscure2 = !obscure2;
                                    setState(() {});
                                  },
                                  icon: Icon(
                                    obscure2 == true
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
                              height: 15,
                            ),
                            Container(
                              width: double.infinity,
                              child: MaterialButton(
                                onPressed: () {
                                  register();
                                },
                                child: Text(
                                  "Sign up",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                          fontSize: 18,
                                          color: BaseColors.whiteColor),
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xFF1D2046),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> register() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    final response = await AppDio.post(
      endPoint: EndPoints.register,
      body: {
        'name': signUpNameController.text,
        'email': signUpEmailController.text,
        'password': signUpPasswordController.text,
        'phone': signUpPhoneController.text,
        'image': '',
      },
    );
    print(response);
    
    final registerResponse = RegisterResponse.fromJson(response.data);
    if (registerResponse.status) {
      navToLogin();
    }
    showToast(registerResponse.message);
  }

  void navToLogin() {
    Navigator.pop(context);
  }
}
