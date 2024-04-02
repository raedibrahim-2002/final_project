import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_graduation_project/Logic/cubit/user_state.dart';
import 'package:flutter_final_graduation_project/models/sign_in_model.dart';
import 'package:flutter_final_graduation_project/repositories/user_repository.dart';
import 'package:flutter_final_graduation_project/Logic/cubit/user_cubit.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.userRepository) : super(UserInitial());
  final UserRepository userRepository;
  //Sign in Form key
  GlobalKey<FormState> signInFormKey = GlobalKey();
  //Sign in email
  TextEditingController signInEmail = TextEditingController();
  //Sign in password
  TextEditingController signInPassword = TextEditingController();

  //Sign Up Form key
  GlobalKey<FormState> signUpFormKey = GlobalKey();

  //Sign up email
  TextEditingController signUpName = TextEditingController();
  TextEditingController signUpEmail = TextEditingController();
  TextEditingController signUpPhoneNumber = TextEditingController();
  //Sign up password
  TextEditingController signUpPassword = TextEditingController();
  //Sign up confirm password
  TextEditingController confirmPassword = TextEditingController();
  SignInModel? user;

  signUp() async {
    emit(SignUpLoading());
    final response = await userRepository.signUp(
      name: signUpName.text,
      email: signUpEmail.text,
      phone: signUpPhoneNumber.text,
      password: signUpPassword.text,
      confirmPassword: confirmPassword.text,
    );
    response.fold(
      (errMessage) => emit(SignUpFailure(errMessage: errMessage)),
      (signUpModel) => emit(SignUpSuccess(message: signUpModel.message)),
    );
  }

  signIn() async {
    emit(SignInLoading());
    final response = await userRepository.signIn(
      email: signInEmail.text,
      password: signInPassword.text,
    );
    response.fold(
      (errMessage) => emit(SignInFailure(errMessage: errMessage)),
      (signInModel) => emit(SignInSuccess()),
    );
  }

  getUserProfile() async {
    emit(GetUserLoading());
    final response = await userRepository.getUserProfile();
    response.fold(
      (errMessage) => emit(GetUserFailure(errMessage: errMessage)),
      (user) => emit(GetUserSuccess(user: user)),
    );
  }
}
