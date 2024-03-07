import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
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
                const Image(image: AssetImage("Images/create.png"),
                  height: 300,
                  width: 350,
                  alignment: Alignment.topCenter,
                ),

                 Text("Create your account",
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

                    ),
                  ) ,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
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
                const SizedBox(
                  height: 20,
                ),

                TextFormField(
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
                    labelText: " Confirm Password",
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
                    child:  Text("Sign up",style: Theme.of(context).textTheme.headlineLarge,
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
                    Text("Don\'t have an account",style: Theme.of(context).textTheme.headlineMedium,),
                    TextButton(onPressed: (){

                    },
                      child: const Text("Sign in "),
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
