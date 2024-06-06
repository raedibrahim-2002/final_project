import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_graduation_project/core/utils/assets.dart';
import 'package:flutter_final_graduation_project/core/utils/colors.dart';
import 'package:flutter_final_graduation_project/features/details/views/details_view.dart';
import 'package:flutter_final_graduation_project/features/favorite/cubit/favorite_cubit.dart';
import 'package:flutter_final_graduation_project/features/favorite/presentation/view/favorite_view.dart';
import 'package:flutter_final_graduation_project/features/filter/presentation/views/fiter_view.dart';
import 'package:flutter_final_graduation_project/features/home/cubit/home_cubit.dart';
import 'package:flutter_final_graduation_project/features/home/presentation/views/notifications_view.dart';
import 'package:flutter_final_graduation_project/features/home/presentation/views/search_view.dart';
import 'package:flutter_final_graduation_project/features/naveBar/presentation/view/navBar_view.dart';
import 'package:flutter_final_graduation_project/models/design_model/design_model.dart';
import 'package:flutter_final_graduation_project/models/product_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    DesignModel? model;
    final cubit = BlocProvider.of<HomeCubit>(context);
    final cubitFavorite = BlocProvider.of<FavoriteCubit>(context);
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          drawer: const NavBarView(),
          appBar: AppBar(
            // backgroundColor: Colors.blue,
            elevation: 0,
            title: const AppBarBody(),
          ),
          body: Padding(
            padding: const EdgeInsets.all(7),
            child: Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return SearchScreen();
                              },
                            ),
                          );
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * .06,
                          width: MediaQuery.of(context).size.width * .83,
                          decoration: BoxDecoration(
                            // color: Color(0xFF7F8Fa),
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 15.0, right: 10),
                                child: Icon(
                                  Icons.search,
                                  color: Colors.black38,
                                ),
                              ),
                              Text(
                                AppString.searchAppString,
                                style: const TextStyle(
                                    color: Colors.black38,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const FilterScreen();
                              },
                            ),
                          );
                        },
                        icon: const Icon(
                          CupertinoIcons.slider_horizontal_3,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .01,
                  ),
                  Expanded(
                    child: cubit.designs.isEmpty
                        ? const CupertinoActivityIndicator()
                        : GridView.builder(
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio:
                                  (MediaQuery.of(context).size.width -
                                          15 -
                                          15) /
                                      (2 * 240),
                              // mainAxisSpacing: 2,
                              crossAxisSpacing: 10,
                            ),
                            itemCount: cubit.designs.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child: Container(
                                        color: BaseColors.primaryColor,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .22,
                                        child: Stack(
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) {
                                                        return DetailsScreen(
                                                            design:
                                                                cubit.designs[
                                                                    index]);
                                                      },
                                                    ),
                                                  );
                                                },
                                                child: Image.network(
                                                  cubit.designs[index].pictures!
                                                      .first.pictureUrl
                                                      .toString(),
                                                  fit: BoxFit.fill,
                                                  // height: double.maxFinite,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      .23,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(6),
                                              child: Align(
                                                alignment: Alignment.topRight,
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                      color: Colors.black12,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      // todo
                                                      //     cubitFavorite.addOrRemoveFromFavorites(productID: model.id!.toString());
                                                    },
                                                    child: const Icon(
                                                      Icons.favorite_outlined,
                                                      size: 25,
                                                      // todo
                                                      //  color: cubitFavorite.favoritesID.contains(model.id.toString()) ? Colors.red : Colors.grey,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 5,
                                    ),
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
                                              cubit.designs[index].name
                                                  .toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineSmall,
                                            ),
                                            const SizedBox(
                                              height: 2,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 8.0),
                                              child: Text(
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                cubit.designs[index].description
                                                    .toString(),
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
            ),
          ),
        );
      },
    );
  }
}

class AppBarBody extends StatelessWidget {
  const AppBarBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Spacer(),
        SizedBox(
          width: MediaQuery.of(context).size.width * .09,
        ),
        Text(
          AppString.home,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const Spacer(),
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
                            return const FavoriteView();
                          },
                        ),
                      );
                    },
                    icon: const Icon(CupertinoIcons.heart)), // أيقونة القلب
                Positioned(
                  top: 13,
                  right: 10,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
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
                      return const NotificationView();
                    },
                  ),
                );
              },
              icon: const Icon(CupertinoIcons.bell),
            ),
          ],
        ),
      ],
    );
  }
}
