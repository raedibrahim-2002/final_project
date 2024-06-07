import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/core/utils/list_view_design.dart';
import 'package:flutter_final_graduation_project/features/room/presentaiton/views/widgets/custom_tab.dart';

class RoomView extends StatelessWidget {
  final String roomTitle;

  RoomView({Key? key, required this.roomTitle});

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
            roomTitle,
            style: Theme.of(context).textTheme.displayMedium,
          )),
          bottom: TabBar(
            dividerColor: Colors.white,
            indicator: const ShapeDecoration(
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
            padding: const EdgeInsets.all(5),
            tabs: const [
              CustomTab(
                title: 'Minimalist',
              ),
              CustomTab(title: 'Modern'),
              CustomTab(title: 'Japandi'),
              CustomTab(title: 'Poho'),
              CustomTab(title: 'Classic'),
              CustomTab(title: 'New classic'),
              CustomTab(title: 'Art Deco'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GrideViewBuilderForDesigns(
              styleName: 'Minimalist',
              categoryName: roomTitle,
            ),
            GrideViewBuilderForDesigns(
                styleName: 'Modern', categoryName: roomTitle),
            GrideViewBuilderForDesigns(
                styleName: 'Japandi', categoryName: roomTitle),
            GrideViewBuilderForDesigns(
                styleName: 'Poho', categoryName: roomTitle),
            GrideViewBuilderForDesigns(
                styleName: 'Classic', categoryName: roomTitle),
            GrideViewBuilderForDesigns(
                styleName: 'New classic', categoryName: roomTitle),
            GrideViewBuilderForDesigns(
                styleName: 'Art Deco', categoryName: roomTitle),
          ],
        ),
      ),
    );
  }
}
