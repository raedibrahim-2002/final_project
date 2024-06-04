import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_graduation_project/features/details/views/details_view.dart';
import 'package:flutter_final_graduation_project/features/favorite/presentation/view/favorite_view.dart';
import 'package:flutter_final_graduation_project/features/filter/presentation/views/fiter_view.dart';
import 'package:flutter_final_graduation_project/features/home/cubit/home_cubit.dart';
import 'package:flutter_final_graduation_project/features/home/presentation/views/notifications_view.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width * .2,
            ),
            Text(
              "Search",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Spacer(),
            Row(
              children: [
                Stack(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return FavoriteView();
                              },
                            ),
                          );
                        },
                        icon: Icon(CupertinoIcons.heart)), // أيقونة القلب
                    Positioned(
                      top: 13,
                      right: 10,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return NotificationView();
                        },
                      ),
                    );
                  },
                  icon: Icon(CupertinoIcons.bell),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: searchController,
              onFieldSubmitted: (String value) {
                print(value);
              },
              onChanged: (input) {
                cubit.filterProduct(input: input);
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.black12,
                labelText: "search",
                prefixIcon: const Icon(
                  Icons.search,
                ),
                suffixIcon: IconButton(
                  icon: Icon(CupertinoIcons.slider_horizontal_3),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return FilterScreen();
                        },
                      ),
                    );
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: cubit.designs.isEmpty
                ? const CupertinoActivityIndicator()
                : GridView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio:
                          (MediaQuery.of(context).size.width - 15 - 15) /
                              (2 * 240),
                      // mainAxisSpacing: 2,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: cubit.filteredProduct.isEmpty
                        ? cubit.designs.length
                        : cubit.filteredProduct.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Container(
                              // color: Colors.yellow,
                              height: MediaQuery.of(context).size.height * .22,
                              child: Stack(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return DetailsScreen(
                                              design: cubit.designs[index],
                                            );
                                          },
                                        ),
                                      );
                                    },
                                    child: Image.network(
                                      cubit.filteredProduct.isEmpty
                                          ? cubit.designs[index].pictures!.first
                                              .pictureUrl
                                              .toString()
                                          : cubit.filteredProduct[index]
                                              .pictures!.first.pictureUrl
                                              .toString(),
                                      fit: BoxFit.fill,
                                      // height: double.maxFinite,
                                      height:
                                          MediaQuery.of(context).size.height *
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
                                                BorderRadius.circular(20)),
                                        child: const Icon(
                                          Icons.favorite_outlined,
                                          size: 25,
                                          color: Colors.red,
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
                              padding:
                                  const EdgeInsets.only(left: 10.0, top: 2),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      maxLines: 1,
                                      overflow: TextOverflow.fade,
                                      cubit.filteredProduct.isEmpty
                                          ? cubit.designs[index].name!
                                          : cubit.filteredProduct[index].name!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: Text(
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        cubit.filteredProduct.isEmpty
                                            ? cubit.designs[index].description!
                                            : cubit.filteredProduct[index]
                                                .description!,
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
                      );
                    },
                  ),
          )
        ],
      ),
    );
  }
}
