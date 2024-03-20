import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class GetCodeScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){},
          icon: const Icon(
            Icons.keyboard_arrow_left,
            size: 50,
          ),
        ),

      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child:  Center(
          child: SingleChildScrollView(
            child: Column(

              children: [
                const Image(image: AssetImage("Images/enter code.png"),
                  height: 350,
                  width: 400,
                  alignment: Alignment.topCenter,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * .08,
                ),
                 Text("Enter 4 Digits Code",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                 Text("We have send code to your Email",style: Theme.of(context).textTheme.headlineSmall,),
                const SizedBox(
                  height: 30,
                ),

            PinCodeTextField(appContext: context,

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
                activeColor:  Color(0xFF1D2046),

                selectedColor: Colors.transparent,
              ),

            ),
                const SizedBox(
                  height: 20,
                ),

                Container(

                  width: double.infinity,

                  child: MaterialButton(onPressed: ()
                  {
                    print(emailController.text);
                    print(passwordController.text);

                  },

                    child:  Text("Verfiy",style: Theme.of(context).textTheme.headlineLarge,
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
                    Text("Don\'t recieve OTP",style: Theme.of(context).textTheme.headlineMedium,),
                    TextButton(onPressed: (){

                    },
                      child: const Text("Resend code "),
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