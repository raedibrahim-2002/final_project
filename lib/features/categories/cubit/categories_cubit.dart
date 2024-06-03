import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_graduation_project/features/categories/data/category_model/category_model.dart';
import 'package:http/http.dart' as http;

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());

  List<CategoryModel> categories = [];

  getCategoriesData() async {
    final response =
        await http.get(Uri.parse("http://granddeco.somee.com/api/Categories"));
    final responseBody = jsonDecode(response.body);
    print("Response: $responseBody");

    if (response.statusCode == 200) {
      for (var item in responseBody) {
        categories.add(CategoryModel.fromJson(item));
      }
      print("Categories: ${categories[3].designs!.length.toString()}");
      emit(GetCategoriesSuccessState());
    } else {
      emit(FailedToGetCategoriesState());
    }
  }
}
