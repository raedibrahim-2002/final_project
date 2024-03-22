import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/core/utils/assets.dart';
import 'package:flutter_final_graduation_project/features/categories/presentation/views/widgets/category_view_body.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

List<CategoryViewBody> categoriesList = [
  CategoryViewBody(categoryTitle: 'Bed Room', categoryImage: AssetsData.room,),
  CategoryViewBody(categoryTitle: 'Living Room', categoryImage:AssetsData.room,),
  CategoryViewBody(categoryTitle: 'Bath Room', categoryImage: AssetsData.room,),
  CategoryViewBody(categoryTitle: 'Kids Room', categoryImage: AssetsData.room,),
  CategoryViewBody(categoryTitle: "Kitchen Room", categoryImage: AssetsData.room,),
];

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: AppBarCategoryViewBody(),
      ),
      body: ListView.builder(
        itemCount: categoriesList.length,
        itemBuilder: (context, index) {
          return categoriesList[index];
        },
      ),
    );
  }
}

class AppBarCategoryViewBody extends StatelessWidget {
  const AppBarCategoryViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        SizedBox(
          width: MediaQuery.of(context).size.width * .09,
        ),
        Text(
          AppString.category,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        Spacer(),
      ],
    );
  }
}
