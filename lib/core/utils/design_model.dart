import 'package:flutter/material.dart';

class DesignModel extends StatelessWidget {
  const DesignModel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              height: MediaQuery.of(context).size.height * .22,
              child: Stack(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Image.asset("assets/images/home_2.jpeg",
                      fit: BoxFit.fill,
                      height: double.maxFinite,
                      // height: MediaQuery.of(context).size.height * .23,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(6),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(20)),
                        child: Icon(
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
            padding: EdgeInsets.only(
              bottom: 5,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0,top: 2),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "BedRoom",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(1),
                      ),
                    ),
                    SizedBox(height: 2,),
                    Text(
                      "Modern Style",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87.withOpacity(.8)),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
