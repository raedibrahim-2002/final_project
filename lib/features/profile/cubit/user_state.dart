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
  String error;
  ChangePasswordWithFailureState({
    required this.error,
  });
}
