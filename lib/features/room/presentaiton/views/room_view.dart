import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/core/utils/design_model.dart';
import 'package:flutter_final_graduation_project/core/utils/list_view_design.dart';
import 'package:flutter_final_graduation_project/features/home/presentation/views/search_view.dart';

class RoomView extends StatelessWidget {
  const RoomView({Key? key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Center(
              child: Text(
            'Living Room',
            style: Theme.of(context).textTheme.displayMedium,
          )),
          bottom: TabBar(
            dividerColor: Colors.white,
            indicator: ShapeDecoration(
              color: Color(0xFF1D2046),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    15,
                  ),
                ),
              ),
            ),
            isScrollable: true,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.values.first,
            indicatorWeight: 1,
            padding: EdgeInsets.all(5),
            tabs: [
              Tab(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("Modern"),
                ),
              ),
              Tab(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("Minimalist"),
                ),
              ),
              Tab(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("Japandi"),
                ),
              ),
              Tab(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("Poho"),
                ),
              ),
              Tab(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("Classic"),
                ),
              ),
              Tab(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("New classic"),
                ),
              ),
              Tab(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("Art Deco"),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GrideViewBuilderForDesigns(),
            GrideViewBuilderForDesigns(),
            GrideViewBuilderForDesigns(),
            GrideViewBuilderForDesigns(),
            GrideViewBuilderForDesigns(),
            GrideViewBuilderForDesigns(),
            GrideViewBuilderForDesigns(),
          ],
        ),
      ),
    );
  }
}
