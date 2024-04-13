import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_graduation_project/core/utils/constans.dart';
import 'package:flutter_final_graduation_project/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<ProductModel> products = [];

  void getProducts() async {
    Response response = await http.get(
        Uri.parse('https://student.valuxapps.com/api/home'),
        headers: {'Authorization': token!, 'lang': 'en'});
    var responcBody = jsonDecode(response.body);
    if (responcBody['status'] == true) {
      for (var item in responcBody['data']["products"]) {
        products.add(ProductModel.fromJson(data: item));
      }
      print(responcBody);
      emit(GetProductsSuccessState());
    } else {
      emit(FailedToGetProductsState());
    }
  }
}
