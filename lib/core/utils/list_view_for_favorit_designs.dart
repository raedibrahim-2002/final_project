import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_graduation_project/core/utils/colors.dart';
import 'package:flutter_final_graduation_project/features/details/views/details_view.dart';
import 'package:flutter_final_graduation_project/features/favorite/cubit/favorite_cubit.dart';
import 'package:flutter_final_graduation_project/features/home/cubit/home_cubit.dart';

class GrideViewBuilderForFavoriteDesigns extends StatelessWidget {
  const GrideViewBuilderForFavoriteDesigns({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 14.0, left: 10, right: 10),
      child: GridView.builder(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio:
              (MediaQuery.of(context).size.width - 15 - 15) / (2 * 252),
          // mainAxisSpacing: 2,
          crossAxisSpacing: 10,
        ),
        itemCount: 5,
        itemBuilder: (_, i) {
          return Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  color: Colors.yellow,
                  height: MediaQuery.of(context).size.height * .22,
                  child: Stack(
                    children: [
                      InkWell(
                          // onTap: () {
                          //   Navigator.pushReplacement(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) {
                          //         return DetailsScreen();
                          //       },
                          //     ),
                          //   );
                          // },
                          child: Image.network(
                        cubit.homeDesigns[i].pictures!.first.pictureUrl
                            .toString(),
                        fit: BoxFit.fill,
                        height: double.infinity,
                        width: double.infinity,
                        // height: MediaQuery.of(context).size.height * 0.23,
                      )),
                      Padding(
                        padding: const EdgeInsets.all(6),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(20)),
                            child: IconButton(
                              onPressed: () {
                                // cubit.addOrRemoveFromFavorites(
                                //     productID:
                                //         cubit.favorites[i].id.toString());
                              },
                              icon: const Icon(
                                Icons.favorite_outlined,
                                size: 25,
                                color: BaseColors.red,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 5,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 2),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cubit.homeDesigns[i].name.toString(),
                          maxLines: 1,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            maxLines: 2,
                            cubit.homeDesigns[i].description.toString(),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
