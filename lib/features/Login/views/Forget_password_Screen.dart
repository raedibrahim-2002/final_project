import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  var emailController = TextEditingController();




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
                const Image(image: AssetImage("Images/forget.png"),
                  height: 350,
                  width: 400,
                  alignment: Alignment.topCenter,

                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * .09,
                ),
                 Text("Forget Password",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(
                  height: 5,
                ),
                 Text("Enter your email address below, and we'll send you a link to reset your password",
                  style: Theme.of(context).textTheme.headlineSmall,),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  onFieldSubmitted: (String value )
                  {
                    print(value);
                  },
                  onChanged: (String value )
                  {
                    print(value);
                  },

                  decoration:const InputDecoration(
                    labelText: "Email",
                    prefixIcon:Icon(
                      Icons.email,
                    ) ,
                    border: OutlineInputBorder(

                    ),
                  ) ,
                ),


                 SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,


                  child: MaterialButton(onPressed: ()
                  {
                    print(emailController.text);

                  },
                    child:  Text("Next", style: Theme.of(context).textTheme.headlineLarge,
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
