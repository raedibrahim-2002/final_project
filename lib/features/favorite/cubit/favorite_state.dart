part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

final class GetFavoriteSuccessState extends FavoriteState {}

final class FailedToGetFavoriteState extends FavoriteState {}

final class AddOrRemoveItemFromFavoritesSuccessState extends FavoriteState {}

final class FailedToAddOrRemoveItemFromFavoritesState extends FavoriteState {}
