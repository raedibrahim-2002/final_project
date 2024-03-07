import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class DetailsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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
              "Details",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Spacer(),
            Row(
              children: [
                Stack(
                  children: [
                    IconButton(
                        onPressed: () {},
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
                  onPressed: () {},
                  icon: Icon(CupertinoIcons.bell),
                ),
              ],
            ),
          ],
        ),
      ),

          body: Padding(
          padding: const EdgeInsets.all(20.0),

          child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.center,

          children: [
          const Image(image: AssetImage("Images/room.jpg"),
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
          ),
            Padding(
              padding:  EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
               Text("Japandi Style Bedroom",
                style: Theme.of(context).textTheme.displayLarge),
              Row(
                children: [
                  IconButton(onPressed: (){},
                      icon: const Icon(CupertinoIcons.star_fill,color: Colors.yellowAccent,)),
                  Text("4.5 | 318 views",style: Theme.of(context).textTheme.headlineSmall)
                ],
              ),
               Text("Discription",style: Theme.of(context).textTheme.headlineLarge
                ),
               Text("The Japandi decor style has risen in popularity these days, thanks to the lovely aesthetic and simplicity the style offers. This style combines the cozy comfort of hygge",
                  style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(
                    height: 15,
                  ),
                   Text("The price of Designs",
                      style: Theme.of(context).textTheme.displayLarge),
                  ]
                        ),
            ),
             Column(
              children: [
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("3D",
                        style: Theme.of(context).textTheme.displayLarge),
                    SizedBox(
                      width: 150,
                    ),
                    Text("2D",
                      style: Theme.of(context).textTheme.displayLarge),
                  ],
                ),

                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Design Price",style: Theme.of(context).textTheme.headlineSmall),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,


                  children: [
                  Container(
                     decoration:  BoxDecoration(
                       shape: BoxShape.rectangle,
                       color: Colors.grey,
                       borderRadius: BorderRadius.circular(7),
                     ),
                     child:  Text(" (120 - 300) EGP ",style: Theme.of(context).textTheme.headlineMedium) ,
                   ),
                    const SizedBox(
                      width: 80,

                    ),
                    Container(
                      decoration:  BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child:  Text("  (40 - 80) EGP  ",style: Theme.of(context).textTheme.headlineMedium) ,
                    ),



                  ],
                ),
                const SizedBox(height: 15,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Finishing Price",style: Theme.of(context).textTheme.headlineSmall,),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration:  BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child:  Text("      Cost +      ",style: Theme.of(context).textTheme.headlineMedium) ,
                    ),
                    const SizedBox(
                      width: 40,

                    ),
                    Container(
                      decoration:  BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child:  Text("      Cost +      ",style: Theme.of(context).textTheme.headlineMedium) ,
                    ),

                  ],
                ),
                const SizedBox(height: 10,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Offer",style: Theme.of(context).textTheme.headlineMedium),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: Text(" 3D + 2D ",style: Theme.of(context).textTheme.displayLarge,),
                    ),

                    SizedBox(
                      width: MediaQuery.of(context).size.height * .09,
                    ),
                    Container(
                      decoration:  BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child:  Text(" (150 - 350) EGP ",style: Theme.of(context).textTheme.headlineMedium) ,
                    ),
                    const SizedBox(
                      width: 40,
                    ),



                  ],
                ),


              ],
            )

          ],
          ),
          ),
          ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF1D2046),
        splashColor:const Color(0xFF1D2046) ,
        onPressed: () {

          print('FAB Clicked!');
        },
        child:  Text("Chat",style: Theme.of(context).textTheme.headlineLarge,),

      ),


          );


  }
}



