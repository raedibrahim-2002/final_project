import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_graduation_project/Logic/cubit/user_cubit.dart';
import 'package:flutter_final_graduation_project/Logic/cubit/user_state.dart';
import 'package:flutter_final_graduation_project/core/utils/colors.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: BlocConsumer<UserCubit, UserState>(listener: (context, state) {
      if (state is SignUpSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(state.message),
        ));
      } else if (state is SignUpFailure) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(state.errMessage),
        ));
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: context.read<UserCubit>().signUpFormKey,
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
                      child: TextFormField(
                        validator: (value) {
                          if (value == null) {
                            return "please Enter your Name ";
                          }
                        },
                        controller: context.read<UserCubit>().signUpName,
                        keyboardType: TextInputType.name,
                        onFieldSubmitted: (String value) {
                          // print(value);
                        },
                        onChanged: (String value) {
                          // print(value);
                        },
                        decoration: InputDecoration(
                          labelText: "Name",
                          hintStyle: Theme.of(context).textTheme.headlineMedium,
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
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: context.read<UserCubit>().signUpPhoneNumber,
                      keyboardType: TextInputType.emailAddress,
                      onFieldSubmitted: (String value) {
                        print(value);
                      },
                      onChanged: (String value) {
                        print(value);
                      },
                      decoration: InputDecoration(
                        labelText: "Phone Number",
                        labelStyle: Theme.of(context).textTheme.headlineMedium,
                        prefixIcon: Icon(
                          Icons.phone,
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
                      controller: context.read<UserCubit>().signUpEmail,
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
                      controller: context.read<UserCubit>().signUpPassword,
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
                      controller: context.read<UserCubit>().confirmPassword,
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
                      child: state is SignInLoading
                          ? CircularProgressIndicator()
                          : MaterialButton(
                              onPressed: () {
                                context.read<UserCubit>().signUp();
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
                ),
              ),
            ),
          ),
        ),
      );
    }));
  }
}
