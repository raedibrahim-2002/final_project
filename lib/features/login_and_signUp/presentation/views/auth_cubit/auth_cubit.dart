import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_graduation_project/core/utils/local_network.dart';
import 'package:flutter_final_graduation_project/features/login_and_signUp/presentation/views/auth_cubit/auth_states.dart';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());

  // Register http
  void register(
      {required String name,
      required String email,
      required String phone,
      required String password}) async {
    emit(RegisterLoadingState());
    Response response = await http.post(
        Uri.parse("https://student.valuxapps.com/api/register"),
        headers: {
          'lang': "en"
        },
        body: {
          'name': name,
          'email': email,
          'phone': phone,
          'password': password,
        });
    var responseBody = jsonDecode(response.body);
    if (responseBody['status'] == true) {
      //emit success
      print(responseBody);
      emit(RegisterSuccessState());
    } else {
      // failed
      print(responseBody);
      emit(FailedToRegisterState(message: responseBody['message']));
    }
  }

  void login({required String email, required String password}) async {
    emit(LoginLoadingState());
    try {
      Response response = await http
          .post(Uri.parse("https://student.valuxapps.com/api/login"), headers: {
        'lang': "en"
      }, body: {
        "email": email,
        "password": password,
      });
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        if (responseData['status'] == true) {
          // debugPrint("User login success and his Data is : $responseData");
          await CacheNetwork.insertToCache(
            key: "token",
            value: responseData['data']['token'],
          );
          emit(LoginSuccessState());
        } else {
          debugPrint("Failed to login, reason : ${responseData['message']}");
          emit(FailedToLoginState(message: responseData['message']));
        }
      }
    } catch (e) {
      emit(FailedToLoginState(message: e.toString()));
    }
  }
}
