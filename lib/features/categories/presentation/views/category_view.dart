import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/core/utils/assets.dart';
import 'package:flutter_final_graduation_project/features/categories/presentation/views/widgets/category_view_body.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

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
        itemCount: 5,
        itemBuilder: (context, index) {
          return CategoryViewBody();
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
          AssetsStrings.categoryString,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        Spacer(),
        IconButton(onPressed: () {}, icon: Icon(Icons.search))
      ],
    );
  }
}
