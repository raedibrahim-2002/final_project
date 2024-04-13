import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/features/details/views/details_view.dart';

class DesignView extends StatelessWidget {
  const DesignView({super.key});

  @override
  Widget build(BuildContext context) {
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
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DetailsScreen();
                        },
                      ),
                    );
                  },
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
            padding: const EdgeInsets.only(left: 10.0, top: 2),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bed Room",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "Modern Style",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
