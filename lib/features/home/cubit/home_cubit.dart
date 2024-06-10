import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_graduation_project/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../../../models/design_model/design_model.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<DesignModel> homeDesigns = [];
  List<DesignModel> allDesigns = [];
  List<DesignModel> favoriteDesigns = [];

  void getHomeDesigns() async {
    try {
      Response response = await http.get(
        Uri.parse('http://154.38.186.138:96/api/Designs/Home'),
      );

      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        homeDesigns = (responseBody as List)
            .map((item) => DesignModel.fromJson(item, data: null))
            .toList();
        emit(GetProductsSuccessState());
      } else {
        emit(FailedToGetProductsState());
      }
    } catch (e) {
      emit(FailedToGetProductsState());
    }
  }

  void getAllDesigns() async {
    try {
      Response response = await http.get(
        Uri.parse('http://154.38.186.138:96/api/Designs/'),
      );

      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        allDesigns = (responseBody as List)
            .map((item) => DesignModel.fromJson(item, data: null))
            .toList();
        emit(GetProductsSuccessState());
      } else {
        emit(FailedToGetProductsState());
      }
    } catch (e) {
      emit(FailedToGetProductsState());
    }
  }

  List<DesignModel> filteredProduct = [];
  void filterProduct({required String input}) {
    filteredProduct = allDesigns
        .where((element) =>
            element.name!.toLowerCase().startsWith(input.toLowerCase()))
        .toList();
    emit(FilterProductsSuccessState());
  }

  void addToFavorites(DesignModel design) {
    favoriteDesigns.add(design);
    emit(FavoriteAdded());
  }

  void removeFromFavorites(DesignModel design) {
    favoriteDesigns.remove(design);
    emit(FavoriteRemoved());
  }

 
  void toggleFavoriteStatus(DesignModel design) {
  if (favoriteDesigns.contains(design)) {
    favoriteDesigns.remove(design);
  } else {
    favoriteDesigns.add(design);
  }
  emit(HomeStateUpdated());
}

}
