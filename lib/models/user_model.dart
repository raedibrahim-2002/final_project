import 'package:flutter_final_graduation_project/network/api/End_point.dart';

class UserModel {
  final String email;
  final String password;
  final String name;

  UserModel({
    required this.email,
    required this.name,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      password: jsonData['user'][ApiKey.password],
      email: jsonData['user'][ApiKey.email],
      name: jsonData['user'][ApiKey.name],
    );
  }
}
