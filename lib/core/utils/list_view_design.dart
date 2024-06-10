import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_graduation_project/core/utils/colors.dart';
import 'package:flutter_final_graduation_project/features/details/views/details_view.dart';
import 'package:flutter_final_graduation_project/features/home/cubit/home_cubit.dart';
import 'package:flutter_final_graduation_project/models/design_model/design_model.dart';
import 'package:http/http.dart' as http;

class GrideViewBuilderForDesigns extends StatefulWidget {
  final String styleName;
  final String categoryName;

  GrideViewBuilderForDesigns({
    Key? key,
    required this.styleName,
    required this.categoryName,
  }) : super(key: key);

  @override
  _GrideViewBuilderForDesignsState createState() =>
      _GrideViewBuilderForDesignsState();
}

class _GrideViewBuilderForDesignsState
    extends State<GrideViewBuilderForDesigns> {
  List<DesignModel> categoryDesigns = [];

  @override
  void initState() {
    super.initState();
    getCategoriesDesigns();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 14.0, left: 10, right: 10),
      child: categoryDesigns.isEmpty
          ? const Center(
              child:
                  CircularProgressIndicator()) // عرض CircularProgressIndicator إذا كانت categoryDesigns فارغة
          : GridView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio:
                    (MediaQuery.of(context).size.width - 15 - 15) / (2 * 240),
                crossAxisSpacing: 10,
              ),
              itemCount: categoryDesigns.length,
              itemBuilder: (_, i) {
                return _buildDesignItem(context, i, cubit);
              },
            ),
    );
  }

  Widget _buildDesignItem(BuildContext context, int index, HomeCubit cubit) {
    final design = categoryDesigns[index];
    return StatefulBuilder(
      builder: (context, setState) {
        return Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return DetailsScreen(design: design);
                    },
                  ));
                },
                child: Container(
                  color: BaseColors.primaryColor,
                  height: MediaQuery.of(context).size.height * .20,
                  child: Stack(
                    children: [
                      InkWell(
                        child: Image.network(
                          design.pictures!.first.pictureUrl.toString(),
                          fit: BoxFit.fill,
                          height: double.maxFinite,
                          width: double.infinity,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  cubit.toggleFavoriteStatus(design);
                                });
                              },
                              icon: Icon(
                                Icons.favorite_outlined,
                                size: 25,
                                color: cubit.favoriteDesigns.contains(design)
                                    ? Colors.red
                                    : Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 2),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        design.name.toString(),
                        maxLines: 1,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          design.description.toString(),
                          maxLines: 2,
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
      },
    );
  }

  Future<void> getCategoriesDesigns() async {
    final response = await http.get(Uri.parse(
        "http://154.38.186.138:96/api/Designs/GetDesigns/?categry=${widget.categoryName}&style=${widget.styleName}"));
    final responseBody = jsonDecode(response.body);

    if (response.statusCode == 200) {
      for (var item in responseBody) {
        categoryDesigns.add(DesignModel.fromJson(item, data: null));
      }
      setState(() {}); // Rebuild the GridView after receiving data
    } else {
      print("Error fetching data");
    }
  }
}
