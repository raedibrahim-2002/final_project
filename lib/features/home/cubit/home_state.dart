part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetProductsSuccessState extends HomeState {}

final class FailedToGetProductsState extends HomeState {}
final class FilterProductsSuccessState extends HomeState {}
final class FavoriteAdded extends HomeState{}
final class FavoriteRemoved extends HomeState{}
final class HomeStateUpdated extends HomeState{}
