part of 'categories_cubit.dart';

sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class GetCategoriesSuccessState extends CategoriesState {}
final class FailedToGetCategoriesState extends CategoriesState {}
