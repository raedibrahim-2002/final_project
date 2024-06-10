import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_graduation_project/core/utils/shared_prefrences.dart';
import 'package:flutter_final_graduation_project/features/details/views/details_view.dart';
import 'package:flutter_final_graduation_project/features/home/cubit/home_cubit.dart';
import 'package:get/get.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    final Random random = Random();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('14'.tr),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return GridView.builder(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio:
                  (MediaQuery.of(context).size.width - 30) / (2 * 240),
              crossAxisSpacing: 10,
            ),
            itemCount: cubit.favoriteDesigns.length,
            itemBuilder: (context, index) {
              final design = cubit.favoriteDesigns[index];

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Container(
                          color: Colors.white,
                          child: Stack(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return DetailsScreen(design: design);
                                      },
                                    ),
                                  );
                                },
                                child: Image.network(
                                  design.pictures!.first.pictureUrl.toString(),
                                  fit: BoxFit.fill,
                                  height:
                                      MediaQuery.of(context).size.height * .23,
                                  width: double.infinity,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(6),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        cubit.toggleFavoriteStatus(design);
                                      },
                                      child: Icon(
                                        cubit.favoriteDesigns.contains(design)
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        size: 25,
                                        color: cubit.favoriteDesigns
                                                .contains(design)
                                            ? Colors.red
                                            : Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: 5, left: 10.0, top: 2),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              design.name.toString(),
                              maxLines: 1,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            const SizedBox(height: 2),
                            Text(
                              design.description.toString(),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
