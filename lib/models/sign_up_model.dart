import '../network/api/End_point.dart';

class SignUpModel {
  final String message;

  SignUpModel({required this.message});
  factory SignUpModel.fromJson(Map<String, dynamic> jsonData) {
    return SignUpModel(message: jsonData[ApiKey.message]);
  }
}
