import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_final_graduation_project/core/utils/colors.dart';
import 'package:flutter_final_graduation_project/core/utils/shared_prefrences.dart';
import 'package:flutter_final_graduation_project/features/chat/presentation/views/chat_view.dart';
import 'package:flutter_final_graduation_project/features/favorite/presentation/view/favorite_view.dart';
import 'package:flutter_final_graduation_project/features/home/presentation/views/notifications_view.dart';
import 'package:flutter_final_graduation_project/models/design_model/design_model.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class DetailsScreen extends StatelessWidget {
  final DesignModel design;
  DetailsScreen({required this.design});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "24".tr,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                design.pictures!.first.pictureUrl!,
                height: MediaQuery.of(context).size.height * .5,
                fit: BoxFit.fill,
                alignment: Alignment.topCenter,
                width: double.infinity,
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(design.name!,
                          style: Theme.of(context).textTheme.displaySmall),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                CupertinoIcons.star_fill,
                                color: Colors.yellowAccent,
                              )),
                          Text("4.5 | 318 ${"Views".tr}",
                              style: Theme.of(context).textTheme.headlineSmall)
                        ],
                      ),
                      Text("Description".tr,
                          style: Theme.of(context).textTheme.titleSmall),
                      Text(design.description!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                color:
                                    PreferenceUtils.getBool(PrefKeys.darkTheme)
                                        ? Colors.white
                                        : Colors.black,
                              )),
                      const SizedBox(
                        height: 15,
                      ),
                      Text("25".tr,
                          style: Theme.of(context).textTheme.displaySmall),
                    ]),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("3D",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontSize: 20,
                                  color: PreferenceUtils.getBool(
                                          PrefKeys.darkTheme)
                                      ? Colors.white
                                      : Colors.black)),
                      SizedBox(
                        width: 150,
                      ),
                      Text("2D",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontSize: 20,
                                  color: PreferenceUtils.getBool(
                                          PrefKeys.darkTheme)
                                      ? Colors.white
                                      : Colors.black)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("25".tr,
                          style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(design.style!.priceOf3D!,
                              style: Theme.of(context).textTheme.labelLarge),
                        ),
                      ),
                      const SizedBox(
                        width: 80,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(design.style!.priceOf2D!,
                              style: Theme.of(context).textTheme.labelLarge),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "26".tr,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("27".tr,
                              style:
                                  Theme.of(context).textTheme.headlineMedium),
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("27".tr,
                              style:
                                  Theme.of(context).textTheme.headlineMedium),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("28".tr,
                          style: Theme.of(context).textTheme.headlineMedium),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        child: Text(
                          " 3D + 2D ",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontSize: 20,
                                  color: PreferenceUtils.getBool(
                                          PrefKeys.darkTheme)
                                      ? Colors.white
                                      : Colors.black),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.height * .09,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Text(design.style!.offer!,
                            style: Theme.of(context).textTheme.labelLarge),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 90,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: PreferenceUtils.getBool(PrefKeys.darkTheme)
            ? Colors.white
            : Color(0xFF1D2046),
        splashColor: Color.fromARGB(255, 232, 233, 236),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ChatView();
              },
            ),
          );
        },
        label: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(
            '16'.tr,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontSize: 18,
                color: PreferenceUtils.getBool(PrefKeys.darkTheme)
                    ? Colors.black
                    : Colors.white),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}
