import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_graduation_project/core/utils/assets.dart';
import 'package:flutter_final_graduation_project/features/categories/cubit/categories_cubit.dart';
import 'package:flutter_final_graduation_project/features/room/presentaiton/views/room_view.dart';
import 'package:get/get.dart';

class UnSignedCategory extends StatefulWidget {
  const UnSignedCategory({super.key});

  @override
  State<UnSignedCategory> createState() => _UnSignedCategoryState();
}

class _UnSignedCategoryState extends State<UnSignedCategory> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
                child: Text("You Have To Sign In".tr,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontSize: 20))),
            content: Text(
                "Please go back to sign in to view the full details and interact."
                    .tr,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 15)),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFF1D2046), // لون الخلفية
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // حواف دائرية
                  ),
                ),
                child: Text(
                  "OK".tr,
                  style: TextStyle(color: Colors.white), // لون النص
                ),
              ),
            ],
          );
        },
      );
    });

    final cubit = BlocProvider.of<CategoriesCubit>(context);
    return BlocConsumer<CategoriesCubit, CategoriesState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            title: const AppBarCategoryViewBody(),
          ),
          body: Stack(
            children: [
              cubit.categories.isEmpty
                  ? const CupertinoActivityIndicator()
                  : ListView.builder(
                      itemCount: cubit.categories.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return RoomView(
                                    roomTitle: cubit.categories[index].name!,
                                  );
                                },
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              width: double.maxFinite,
                              height: MediaQuery.of(context).size.height * .16,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        cubit.categories[index].pictureUrl!),
                                    fit: BoxFit.fill),
                              ),
                              child: Center(
                                child: Text(
                                  cubit.categories[index].name!,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color: Colors.black.withOpacity(0),
                ),
              ),
            ],
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
