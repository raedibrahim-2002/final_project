import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_final_graduation_project/core/utils/constans.dart';
import 'package:flutter_final_graduation_project/core/utils/local_network.dart';
import 'package:flutter_final_graduation_project/features/profile/data/user_model.dart';
//import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  UserModel? userModel;
  void getUserData() async {
    emit(GetUserDataLoadingState());
    Response response = await http.get(
        Uri.parse(
          "https://student.valuxapps.com/api/profile",
        ),
        headers: {
          'Authorization': token!,
          'lang': 'en' // السطر دا يتشال لما نستخدم api بتاعنا
        });
    var responseData = jsonDecode(response.body);
    if (responseData['status'] == true) {
      userModel = UserModel.fromJson(data: responseData['data']);
      print('response is : $responseData');
      emit(GetUserDataSuccessState());
    } else {
      emit(FailedToGetUserDataState(error: responseData['message']));
    }
  }

  void changePassword(
      {required String userCurrentPassword,
      required String newPassword}) async {
    emit(ChangePasswordLoadingState());
    Response response = await http.post(
        Uri.parse("https://student.valuxapps.com/api/change-password"),
        headers: {
          'lang': 'en',
          'Content-Type': 'application/json',
          'Authorization': token!
        },
        body: {
          'current_password': userCurrentPassword,
          'new_password': newPassword,
        });

    var responseDecoded = jsonDecode(response.body);

    if (response.statusCode == 200) {
      if (responseDecoded['status'] == true) {
        await CacheNetwork.insertToCache(key: 'password', value: newPassword);
        currentPassword = await CacheNetwork.getCacheData(key: "password");
        emit(ChangePasswordSuccessState());
      } else {
        emit(ChangePasswordWithFailureState(error: responseDecoded['message']));
      }
    } else {
      emit(ChangePasswordWithFailureState(
          error: "something went wrong , try again later "));
    }
  }

  void updateUserData(
      {required String name,
      required String phone,
      required String email}) async {
    emit(UpdateUserDataLoadingState());
    try {
      Response response = await http.put(
          Uri.parse('https://student.valuxapps.com/api/update-profile'),
          headers: {'lang': 'en', 'Authorization': token!},
          body: {'name': name, 'phone': phone, 'email': email});
      var responseBody = jsonDecode(response.body);
      if (responseBody['status'] == true) {
        getUserData();
        emit(UpdateUserDataSuccessState());
      } else {
        emit(UpdateUserDataWithFailureState(error: responseBody['message']));
      }
    } catch (e) {
      emit(UpdateUserDataWithFailureState(error: e.toString()));
    }
  }
}
