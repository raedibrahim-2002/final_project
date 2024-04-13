import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_graduation_project/core/utils/assets.dart';
import 'package:flutter_final_graduation_project/features/categories/cubit/categories_cubit.dart';
import 'package:flutter_final_graduation_project/features/room/presentaiton/views/room_view.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<CategoriesCubit>(context);
    return BlocConsumer<CategoriesCubit, CategoriesState>(
      listener: (context, state) {      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            title: const AppBarCategoryViewBody(),
          ),
          body: cubit.categories.isEmpty
              ? const CupertinoActivityIndicator()
              : ListView.builder(
                  itemCount: cubit.categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // showModalBottomSheet(
                        //   context: context,
                        //   builder: (BuildContext context) {
                        //     return Container(
                        //       height: 200,
                        //       padding: EdgeInsets.all(16.0),
                        //       child: Row(
                        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //         children: [
                        //           ElevatedButton(onPressed: () {}, child: Text('Login')),
                        //           ElevatedButton(onPressed: () {}, child: Text('Sign Up')),
                        //         ],
                        //       ),
                        //     );
                        //   },
                        // );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return RoomView(
                                roomTitle: cubit.categories[index].title!,
                              );
                            },
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.maxFinite,
                          height: MediaQuery.of(context).size.height * .16,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: NetworkImage(
                                    cubit.categories[index].image!),
                                fit: BoxFit.fill),
                          ),
                          child: Center(
                            child: Text(
                              cubit.categories[index].title!,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
        );
      },
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
        const Spacer(),
        SizedBox(
          width: MediaQuery.of(context).size.width * .09,
        ),
        Text(
          AppString.category,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const Spacer(),
      ],
    );
  }
}
