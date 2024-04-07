import 'package:flutter/cupertino.dart';
import 'package:flutter_final_graduation_project/core/utils/design_model.dart';

class GrideViewBuilderForDesigns extends StatelessWidget {
  const GrideViewBuilderForDesigns({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14.0, left: 10, right: 10),
      child: GridView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio:
              (MediaQuery.of(context).size.width - 15 - 15) / (2 * 235),
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
    );
  }
}
