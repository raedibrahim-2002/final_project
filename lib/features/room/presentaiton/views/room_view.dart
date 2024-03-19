import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/core/utils/design_model.dart';
import 'package:flutter_final_graduation_project/core/utils/list_view_design.dart';

class RoomView extends StatelessWidget {
  const RoomView({Key? key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Center(
              child: Text(
            'Living Room',
            style: Theme.of(context).textTheme.displayMedium,
          )),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
              ),
            ),
          ],
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
                  child: Text("Modern1"),
                ),
              ),
              Tab(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("Modern2"),
                ),
              ),
              Tab(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("Modern3"),
                ),
              ),
              Tab(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("Modern4"),
                ),
              ),
              Tab(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("Modern5"),
                ),
              ),
              Tab(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("Modern6"),
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
          ],
        ),
      ),
    );
  }
}
