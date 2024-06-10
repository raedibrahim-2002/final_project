import 'dart:math'; // Import the Random class
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
        title: Center(child: Text('14'.tr)),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: cubit.favoriteDesigns.length,
            itemBuilder: (context, index) {
              final design = cubit.favoriteDesigns[index];
              double randomHeight =
                  180 + random.nextInt(80).toDouble(); // Reduce height range

              return GestureDetector(
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
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 6.0, horizontal: 12.0), // Reduce margin
                  padding: const EdgeInsets.all(6.0), // Reduce padding
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                        12), // Slightly smaller border radius
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(
                                12), // Slightly smaller border radius
                            child: Image.network(
                              design.pictures!.first.pictureUrl.toString(),
                              height: 250,
                              width: double.infinity,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: GestureDetector(
                              onTap: () {
                                cubit.toggleFavoriteStatus(design);
                              },
                              child: Icon(
                                cubit.favoriteDesigns.contains(design)
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: cubit.favoriteDesigns.contains(design)
                                    ? Colors.red
                                    : Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6.0), // Reduce space
                      Text(
                        design.name.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                              color: PreferenceUtils.getBool(PrefKeys.darkTheme)
                                  ? Colors.black
                                  : Colors.black,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        design.description.toString(),
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: PreferenceUtils.getBool(PrefKeys.darkTheme)
                                  ? Colors.black
                                  : Colors.black,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
