import 'package:flutter_final_graduation_project/models/sign_in_model.dart';
import 'package:flutter_final_graduation_project/models/sign_up_model.dart';
import 'package:flutter_final_graduation_project/models/user_model.dart';
import 'package:flutter_final_graduation_project/network/api/api_consumer.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:flutter_final_graduation_project/repositories/user_repository.dart';

import '../cache/cache_helper.dart';
import '../network/api/End_point.dart';
import '../network/errors/exceptions.dart';
import 'package:dartz/dartz.dart';

class UserRepository {
  final ApiConsumer api;

  UserRepository({required this.api});
  Future<Either<String, SignInModel>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await api.post(
        EndPoint.signIn,
        data: {
          ApiKey.email: email,
          ApiKey.password: password,
        },
      );
      final user = SignInModel.fromJson(response);
      final decodedToken = JwtDecoder.decode(user.token);
      CacheHelper().saveData(key: ApiKey.token, value: user.token);
      CacheHelper().saveData(key: ApiKey.id, value: decodedToken[ApiKey.id]);
      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  Future<Either<String, SignUpModel>> signUp({
    required String email,
    required String password,
    required String confirmPassword,
    required String name,
    required String phone,
  }) async {
    try {
      final response = await api.post(
        EndPoint.signUp,
        isFromData: true,
        data: {
          ApiKey.name: name,
          ApiKey.phone: phone,
          ApiKey.email: email,
          ApiKey.password: password,
          ApiKey.confirmPassword: confirmPassword,
        },
      );
      final signUPModel = SignUpModel.fromJson(response);
      return Right(signUPModel);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  Future<Either<String, UserModel>> getUserProfile() async {
    try {
      final response = await api.get(
        EndPoint.getUserDataEndPoint(
          CacheHelper().getData(key: ApiKey.id),
        ),
      );
      return Right(UserModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }
}
