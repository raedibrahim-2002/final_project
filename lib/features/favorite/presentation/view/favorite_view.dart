import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/core/utils/assets.dart';
import 'package:flutter_final_graduation_project/core/utils/colors.dart';
import 'package:flutter_final_graduation_project/core/utils/styles.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          AppString.favorite,
          style: getMediumTextStyleInter(
              color: BaseColors.blackColor, fontSize: 20),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.bell),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio:
                (MediaQuery.of(context).size.width - 15 - 15) / (2 * 200),
            mainAxisSpacing: 15,
            crossAxisSpacing: 10,
          ),
          itemCount: 6,
          itemBuilder: (_, i) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                height: MediaQuery.of(context).size.height * 1,
                child: Stack(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        "assets/images/home_2.jpeg",
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
                              color: BaseColors.black12,
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
            );
          },
        ),
      ),
    );
  }
}
