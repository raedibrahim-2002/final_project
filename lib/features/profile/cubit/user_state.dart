part of 'user_cubit.dart';
abstract class UserState {}

class UserInitial extends UserState {}

class GetUserDataSuccessState extends UserState {}

class GetUserDataLoadingState extends UserState {}

class FailedToGetUserDataState extends UserState {
  String error;
  FailedToGetUserDataState({required this.error});
}