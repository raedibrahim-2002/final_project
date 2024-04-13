import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_final_graduation_project/core/utils/constans.dart';
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
}