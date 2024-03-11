import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/core/utils/design_model.dart';
import 'package:flutter_final_graduation_project/features/naveBar/presentation/view/navBar_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBarView(),
      appBar: AppBar(
        // backgroundColor: Colors.blue,
        elevation: 0,
        title: AppBarBody(),
      ),
      body: Padding(
        padding: EdgeInsets.all(7),
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .06,
                    width: MediaQuery.of(context).size.width * .83,
                    decoration: BoxDecoration(
                      // color: Color(0xFF7F8Fa),
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 10),
                          child: Icon(
                            Icons.search,
                            color: Colors.black38,
                          ),
                        ),
                        Text(
                          "Search",
                          style: TextStyle(
                              color: Colors.black38,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        )
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.slider_horizontal_3,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              Expanded(
                child: GridView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio:
                        (MediaQuery.of(context).size.width - 15 - 15) /
                            (2 * 230),
                    // mainAxisSpacing: 2,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: 10,
                  itemBuilder: (_, i) {
                    return DesignModel();
                    // return OverflowBox(
                    //   maxHeight: 290.0 + 70.0,
                    //   child: Container(
                    //     margin: EdgeInsets.only(top: 70),
                    //     child: DesignModel(),
                    //   ),
                    // );
                  },
                ),
              )
            ],
          ),
        ),
      ),
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
        Spacer(),
        SizedBox(
          width: MediaQuery.of(context).size.width * .09,
        ),
        Text(
          "Home",
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
    );
  }
}
