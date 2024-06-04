import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_final_graduation_project/core/utils/colors.dart';
import 'package:flutter_final_graduation_project/features/chat/presentation/views/chat_view.dart';
import 'package:flutter_final_graduation_project/features/favorite/presentation/view/favorite_view.dart';
import 'package:flutter_final_graduation_project/features/home/presentation/views/notifications_view.dart';
import 'package:flutter_final_graduation_project/features/unsignedBottomnavigationBar2/unSignedChat.dart';
import 'package:flutter_final_graduation_project/models/design_model/design_model.dart';

class UnSignedDesignDetailsScreen extends StatelessWidget {
  final DesignModel design;
  UnSignedDesignDetailsScreen({required this.design});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
                child: Text("You Have To Sign In",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontSize: 20))),
            content:Text(
                "Please go back to sign in to view the full details and interact.",
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
                  "OK",
                  style: TextStyle(color: Colors.white), // لون النص
                ),
              ),
            ],
          );
        },
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Details",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * .09,
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          // Your existing content goes here
          Padding(
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
                            Text("4.5 | 318 views",
                                style:
                                    Theme.of(context).textTheme.headlineSmall)
                          ],
                        ),
                        Text("Description",
                            style: Theme.of(context).textTheme.titleSmall),
                        Text(design.description!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: BaseColors.blackColor)),
                        const SizedBox(
                          height: 15,
                        ),
                        Text("The price of Designs",
                            style: Theme.of(context).textTheme.displaySmall),
                      ],
                    ),
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
                                      color: BaseColors.blackColor)),
                          SizedBox(
                            width: 150,
                          ),
                          Text("2D",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontSize: 20,
                                      color: BaseColors.blackColor)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Design Price",
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
                                  style:
                                      Theme.of(context).textTheme.labelLarge),
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
                                  style:
                                      Theme.of(context).textTheme.labelLarge),
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
                            "Finishing Price",
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
                              child: Text("Cost +",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium),
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
                              child: Text("Cost +",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium),
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
                          Text("Offer",
                              style:
                                  Theme.of(context).textTheme.headlineMedium),
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
                                      color: BaseColors.blackColor),
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
          // Blur effect
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              color: Colors.black.withOpacity(0.1),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF1D2046),
        splashColor: Color.fromARGB(255, 232, 233, 236),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return UnSignedChat2();
              },
            ),
          );
        },
        label: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(
            'chat',
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontSize: 18, color: BaseColors.whiteColor),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}
