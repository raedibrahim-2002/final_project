import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/core/utils/list_view_design.dart';
import 'package:flutter_final_graduation_project/core/utils/shared_prefrences.dart';
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
          centerTitle: true,
          backgroundColor: PreferenceUtils.getBool(PrefKeys.darkTheme)
              ? Colors.black
              : Colors.white,
          elevation: 0,
          title: Text(
            roomTitle,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          bottom: TabBar(
            dividerColor: PreferenceUtils.getBool(PrefKeys.darkTheme)
                ? Colors.white
                : Colors.black,
            indicator: ShapeDecoration(
              color: PreferenceUtils.getBool(PrefKeys.darkTheme)
                  ? Colors.white
                  : Colors.black,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    15,
                  ),
                ),
              ),
            ),
            isScrollable: true,
            labelColor: PreferenceUtils.getBool(PrefKeys.darkTheme)
                ? Colors.black
                : Colors.white,
            unselectedLabelColor: PreferenceUtils.getBool(PrefKeys.darkTheme)
                ? Colors.white
                : Colors.black,
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
              styleName: 'Minimalist style',
              categoryName: roomTitle,
            ),
            GrideViewBuilderForDesigns(
                styleName: 'Modern', categoryName: roomTitle),
            GrideViewBuilderForDesigns(
                styleName: 'Japandi style', categoryName: roomTitle),
            GrideViewBuilderForDesigns(
                styleName: 'Poho style', categoryName: roomTitle),
            GrideViewBuilderForDesigns(
                styleName: 'Classic style', categoryName: roomTitle),
            GrideViewBuilderForDesigns(
                styleName: 'New classic style', categoryName: roomTitle),
            GrideViewBuilderForDesigns(
                styleName: 'Art Deco style', categoryName: roomTitle),
          ],
        ),
      ),
    );
  }
}
