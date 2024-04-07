import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_final_graduation_project/core/utils/colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class GetCodeView extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image(
                  image: AssetImage("assets/images/entercode.png"),
                  height: MediaQuery.of(context).size.height * .25,
                  width: double.infinity,
                  alignment: Alignment.topCenter,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * .08,
                ),
                Text(
                  "Enter 4 Digits Code",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 24, color: BaseColors.blackColor),
                ),
                Text(
                  "We have send code to your Email",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontSize: 14),
                ),
                const SizedBox(
                  height: 30,
                ),
                PinCodeTextField(
                  appContext: context,
                  length: 4,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  pinTheme: PinTheme(
                    fieldHeight: 70,
                    fieldWidth: 70,
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(20),
                    inactiveColor: Color(0xFF1D2046),
                    activeColor: Color(0xFF1D2046),
                    selectedColor: Colors.transparent,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: () {
                      print(emailController.text);
                      print(passwordController.text);
                    },
                    child: Text(
                      "Verfiy",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
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
                      "Don\'t recieve OTP",
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(fontSize: 14),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Resend code ",
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                fontSize: 14,
                              ),
                        )),
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
