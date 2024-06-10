// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_cubit.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class GetUserDataSuccessState extends UserState {}

class GetUserDataLoadingState extends UserState {}

class FailedToGetUserDataState extends UserState {
  String error;
  FailedToGetUserDataState({required this.error});
}

class ChangePasswordLoadingState extends UserState {}

class ChangePasswordSuccessState extends UserState {}

class ChangePasswordWithFailureState extends UserState {
  final String error;
  ChangePasswordWithFailureState({
    required this.error,
  });
}
class UpdateUserDataSuccessState extends UserState {}

class UpdateUserDataLoadingState extends UserState {}

class UpdateUserDataWithFailureState extends UserState {
  String error;
  UpdateUserDataWithFailureState({required this.error});
}
