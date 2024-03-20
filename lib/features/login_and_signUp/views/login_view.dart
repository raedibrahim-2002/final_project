import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child:  Center(
          child: SingleChildScrollView(
            child: Column(
             
              children: [
                const Image(image: AssetImage("Images/rafiki 2.png"),
                  height: 300,
                  width: 350,
                  alignment: Alignment.topCenter,
                ),
                 Text("Login to your account",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(
                  height: 30,
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
                           borderRadius: BorderRadius.only(),
                        ),
                      ) ,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    onFieldSubmitted: (String value )
                    {
                      print(value);
                    },
                    onChanged: (String value )
                    {
                      print(value);
                    },
                              
                    decoration:const InputDecoration(
                      
                      labelText: "Password",
                      prefixIcon:Icon(
                        Icons.lock,
                      ) ,
                     suffixIcon: Icon(
                        Icons.remove_red_eye,
                      ),

                      border: OutlineInputBorder(
                              
                      ),
                    ) ,
                    
                  ),
                ),

                 Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                 TextButton(onPressed: (){

                 },
                     child: const Text("Forget password "),
                 ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: double.infinity,

            
                  child: MaterialButton(onPressed: ()
                  {
                    print(emailController.text);
                    print(passwordController.text);
            
                  },

                  child:  Text("Sign in",style: Theme.of(context).textTheme.headlineLarge,
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
                    Text("Don\'t have an account" ,style: Theme.of(context).textTheme.headlineMedium,),
                    TextButton(onPressed: (){

                    },
                      child: const Text("Sign up "),
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