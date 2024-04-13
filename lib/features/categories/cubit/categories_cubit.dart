import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter_final_graduation_project/features/categories/data/category_model.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());

  List<CategoryModel> categories = [];

  getCategoriesData() async {
    Response response = await http
        .get(Uri.parse("https://student.valuxapps.com/api/categories"));
    final responseBody = jsonDecode(response.body);
    if (responseBody["status"] == true) {
      for (var item in responseBody['data']['data']) {
        categories.add(CategoryModel.fromJson(data: item));
        print(categories[0].image);
      }
      emit(GetCategoriesSuccessState());
    } else {
      emit(FailedToGetCategoriesState());
    }
  }
}
