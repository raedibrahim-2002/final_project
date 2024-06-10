import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_graduation_project/core/utils/assets.dart';
import 'package:flutter_final_graduation_project/core/utils/colors.dart';
import 'package:flutter_final_graduation_project/core/utils/shared_prefrences.dart';
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
import 'package:get/get.dart';

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
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // Update the UI when favorite status changes
        if (state is HomeStateUpdated) {
          setState(() {});
        }
      },
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
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0, right: 10),
                              child: Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "17".tr,
                              style: const TextStyle(
                                  color: Colors.white,
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
                      icon: Icon(
                        CupertinoIcons.slider_horizontal_3,
                        color: PreferenceUtils.getBool(PrefKeys.darkTheme)
                            ? Colors.white
                            : Colors.black,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                Expanded(
                  child: cubit.homeDesigns.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : GridView.builder(
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio:
                                (MediaQuery.of(context).size.width - 15 - 15) /
                                    (2 * 240),
                            // mainAxisSpacing: 2,
                            crossAxisSpacing: 10,
                          ),
                          itemCount: cubit.homeDesigns.length,
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
                                                              cubit.homeDesigns[
                                                                  index]);
                                                    },
                                                  ),
                                                );
                                              },
                                              child: Image.network(
                                                cubit.homeDesigns[index]
                                                    .pictures!.first.pictureUrl
                                                    .toString(),
                                                fit: BoxFit.fill,
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
                                                      BorderRadius.circular(20),
                                                ),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    cubit.toggleFavoriteStatus(
                                                        cubit.homeDesigns[
                                                            index]);
                                                  },
                                                  child: Icon(
                                                    cubit.favoriteDesigns
                                                            .contains(cubit
                                                                    .homeDesigns[
                                                                index])
                                                        ? Icons.favorite
                                                        : Icons.favorite_border,
                                                    size: 25,
                                                    color: cubit.favoriteDesigns
                                                            .contains(cubit
                                                                    .homeDesigns[
                                                                index])
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
                                            cubit.homeDesigns[index].name
                                                .toString(),
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
                                              cubit.homeDesigns[index]
                                                  .description
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
    final cubit = BlocProvider.of<HomeCubit>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Spacer(),
        SizedBox(
          width: MediaQuery.of(context).size.width * .09,
        ),
        Text(
          "1".tr,
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
                    icon: const Icon(CupertinoIcons.heart)),
                if (cubit.favoriteDesigns.isNotEmpty)
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
