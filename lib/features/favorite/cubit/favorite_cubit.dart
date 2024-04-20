import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_graduation_project/core/utils/constans.dart';
import 'package:flutter_final_graduation_project/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

part 'favorite_state.dart';
class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());
  List<ProductModel> favorites = [];
  Set<String> favoritesID = {};
  Future<void> getFavorites() async {
    favorites.clear();
    Response response = await http.get(
      Uri.parse('https://student.valuxapps.com/api/favorites'),
      headers: {"lang": "en", "Authorization": token!},
    );
    var responcBody = jsonDecode(response.body);
    if (responcBody['status'] == true) {
      for (var item in responcBody['data']["data"]) {
        favorites.add(ProductModel.fromJson(data: item['product']));
         favoritesID.add(item['product']['id'].toString());
      }
        debugPrint("Favorites number  ${favorites.length}");
      emit(GetFavoriteSuccessState());
    } else {
      emit(FailedToGetFavoriteState());
    }
  }
   void addOrRemoveFromFavorites({required String productID}) async {
    Response response = await http.post(
      Uri.parse("https://student.valuxapps.com/api/favorites"),
      headers:
      {
        "lang" : "en",
        "Authorization" :token!
      },
      body:
      {
        "product_id" : productID
      }
    );
    var responseBody = jsonDecode(response.body);
    if( responseBody['status'] == true )
    {
        if( favoritesID.contains(productID) == true )
          {
            // delete
            favoritesID.remove(productID);
          }
        else
          {
            // add
            favoritesID.add(productID);
          }
        await getFavorites();
        emit(AddOrRemoveItemFromFavoritesSuccessState());
      }
    else
      {
        emit(FailedToAddOrRemoveItemFromFavoritesState());
      }
  }

}
