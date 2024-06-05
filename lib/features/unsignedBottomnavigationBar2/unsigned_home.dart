import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_graduation_project/core/utils/assets.dart';
import 'package:flutter_final_graduation_project/features/details/views/details_view.dart';
import 'package:flutter_final_graduation_project/features/favorite/cubit/favorite_cubit.dart';

import 'package:flutter_final_graduation_project/features/favorite/presentation/view/favorite_view.dart';
import 'package:flutter_final_graduation_project/features/filter/presentation/views/fiter_view.dart';
import 'package:flutter_final_graduation_project/features/home/cubit/home_cubit.dart';
import 'package:flutter_final_graduation_project/features/home/presentation/views/notifications_view.dart';
import 'package:flutter_final_graduation_project/features/home/presentation/views/search_view.dart';
import 'package:flutter_final_graduation_project/features/naveBar/presentation/view/navBar_view.dart';
import 'package:flutter_final_graduation_project/features/unsignedBottomnavigationBar2/unSigned_design_details.dart';
import 'package:flutter_final_graduation_project/models/design_model/design_model.dart';
import 'package:flutter_final_graduation_project/models/product_model.dart';

class UnSignedHomeView2 extends StatefulWidget {
  const UnSignedHomeView2({super.key});

  @override
  State<UnSignedHomeView2> createState() => _UnSignedHomeView2State();
}

class _UnSignedHomeView2State extends State<UnSignedHomeView2> {
  @override
  Widget build(BuildContext context) {
    DesignModel? model;
    final cubit = BlocProvider.of<HomeCubit>(context);
    final cubitFavorite = BlocProvider.of<FavoriteCubit>(context);
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            // backgroundColor: Colors.blue,
            elevation: 0,
            title: const AppBarBody(),
          ),
          body: Padding(
            padding: const EdgeInsets.all(7),
            child: Center(
              child: Container(
                child: Column(
                  children: [
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
                                          color: Colors.yellow,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
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
                                                          return UnSignedDesignDetailsScreen(
                                                              design:
                                                                  cubit.designs[
                                                                      index]);
                                                        },
                                                      ),
                                                    );
                                                  },
                                                  child: Image.network(
                                                    cubit
                                                        .designs[index]
                                                        .pictures!
                                                        .first
                                                        .pictureUrl
                                                        .toString(),
                                                    fit: BoxFit.fill,
                                                    // height: double.maxFinite,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            .23,
                                                  ),
                                                ),
                                              ),
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
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  cubit.designs[index]
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppString.home,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        SizedBox(
          width: 40,
        )
      ],
    );
  }
}