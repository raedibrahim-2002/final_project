import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_graduation_project/core/utils/colors.dart';
import 'package:flutter_final_graduation_project/core/utils/shared_prefrences.dart';
import 'package:flutter_final_graduation_project/features/details/views/details_view.dart';
import 'package:flutter_final_graduation_project/features/favorite/presentation/view/favorite_view.dart';
import 'package:flutter_final_graduation_project/features/filter/presentation/views/fiter_view.dart';
import 'package:flutter_final_graduation_project/features/home/cubit/home_cubit.dart';
import 'package:flutter_final_graduation_project/features/home/presentation/views/notifications_view.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "17".tr,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  height: MediaQuery.of(context).size.height * .06,
                  width: MediaQuery.of(context).size.width * .88,
                  child: TextFormField(
                    controller: searchController,
                    onFieldSubmitted: (String value) {
                      // print(value);
                    },
                    onChanged: (input) {
                      cubit.filterProduct(input: input);
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey,
                      labelText: "17".tr,
                      labelStyle: TextStyle(
                          color: PreferenceUtils.getBool(PrefKeys.darkTheme)
                              ? Colors.white
                              : Colors.black), // Change text color to black
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.white, // Change icon color to black
                      ),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(15.0), // More rounded corners
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: TextStyle(
                        color:
                            Colors.black), // Change input text color to black
                  ),
                ),
              ),
              Expanded(
                child: cubit.allDesigns.isEmpty
                    ? const CupertinoActivityIndicator()
                    : GridView.builder(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio:
                              (MediaQuery.of(context).size.width - 15 - 15) /
                                  (2 * 253),
                          crossAxisSpacing: 10,
                        ),
                        itemCount: cubit.filteredProduct.isEmpty
                            ? cubit.allDesigns.length
                            : cubit.filteredProduct.length,
                        itemBuilder: (context, index) {
                          final design = cubit.filteredProduct.isEmpty
                              ? cubit.allDesigns[index]
                              : cubit.filteredProduct[index];

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Container(
                                    color: BaseColors.primaryColor,
                                    height: MediaQuery.of(context).size.height *
                                        .22,
                                    child: Stack(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return DetailsScreen(
                                                      design: design);
                                                },
                                              ),
                                            );
                                          },
                                          child: Image.network(
                                            design.pictures!.first.pictureUrl
                                                .toString(),
                                            fit: BoxFit.fill,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .23,
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
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: GestureDetector(
                                                onTap: () {
                                                  cubit.toggleFavoriteStatus(
                                                      design);
                                                },
                                                child: Icon(
                                                  Icons.favorite_outlined,
                                                  size: 25,
                                                  color: cubit.favoriteDesigns
                                                          .contains(design)
                                                      ? Colors.red
                                                      : Colors.grey,
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
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0, top: 2),
                                    child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            maxLines: 1,
                                            overflow: TextOverflow.fade,
                                            design.name.toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall,
                                          ),
                                          const SizedBox(height: 2),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 8.0),
                                            child: Text(
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              design.description.toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
              )
            ],
          ),
        );
      },
    );
  }
}
