import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_graduation_project/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../../models/design_model/design_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<DesignModel> designs = [];

  void getProducts() async {
    try {
      Response response = await http.get(
        Uri.parse('http://granddeco.somee.com/api/Designs/'),
      );

      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        designs = (responseBody as List)
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
    filteredProduct = designs
        .where((element) =>
            element.name!.toLowerCase().startsWith(input.toLowerCase()))
        .toList();
    emit(FilterProductsSuccessState());
  }
}
