import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/core/utils/assets.dart';
import 'package:flutter_final_graduation_project/core/utils/colors.dart';
import 'package:flutter_final_graduation_project/core/utils/styles.dart';
import 'package:flutter_final_graduation_project/features/categories/presentation/views/category_view.dart';
import 'package:flutter_final_graduation_project/features/filter/presentation/views/designListViewFilter.dart';
import 'package:flutter_final_graduation_project/features/filter/presentation/views/widgets/item_type_category.dart';
import 'package:flutter_final_graduation_project/features/room/presentaiton/views/room_view.dart';
import 'package:flutter_final_graduation_project/models/design_model/design_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String selectedCategory = '';
  String selectedStyle = '';

  Future<void> getCategoriesDesigns(BuildContext context) async {
    final response = await http.get(Uri.parse(
        "http://154.38.186.138:96/api/Designs/GetDesigns/?categry=$selectedCategory&style=$selectedStyle"));
    final responseBody = jsonDecode(response.body);

    if (response.statusCode == 200) {
      List<DesignModel> categoryDesigns = [];
      for (var item in responseBody) {
        categoryDesigns.add(DesignModel.fromJson(item, data: null));
      }
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DesignsListView(designs: categoryDesigns),
        ),
      );
    } else {
      print("Error fetching data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          '23'.tr,
          style: getMediumTextStyleInter(
            color: BaseColors.blackColor,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Divider(
                color: BaseColors.grey,
              ),
            ),
            Text('33'.tr),
            const SizedBox(
              height: 16,
            ),
            FirstLineCategory(),
            SecondLineCategory(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Divider(
                color: BaseColors.grey,
              ),
            ),
            Text('34'.tr),
            const SizedBox(
              height: 16,
            ),
            FirstLineStyles(),
            SecondLineStyles(),
            ThirdLineStyle(),
            // إضافة زر Apply
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity, // جعل الزر يأخذ عرض الشاشة بالكامل
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedCategory.isNotEmpty &&
                        selectedStyle.isNotEmpty) {
                      getCategoriesDesigns(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('35'.tr),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor:
                        BaseColors.primaryColor, // لون الزر الأساسي
                    shadowColor: Colors.deepPurpleAccent, // لون الظل
                    elevation: 10, // ارتفاع الظل
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // زوايا مستديرة
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15), // التباعد الداخلي
                  ),
                  child: Text(
                    '36'.tr,
                    style: TextStyle(
                      fontSize: 18, // حجم الخط
                      fontWeight: FontWeight.bold, // وزن الخط
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding ThirdLineStyle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ItemTypecategory(
            onTap: () {
              setState(() {
                selectedStyle = 'New classic Style';
              });
            },
            title: 'New classic',
            color: selectedStyle == 'New classic Style'
                ? BaseColors.primaryColor
                : Colors.grey,
          ),
        ],
      ),
    );
  }

  Padding SecondLineStyles() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ItemTypecategory(
            onTap: () {
              setState(() {
                selectedStyle = 'Minimalist Style';
              });
            },
            title: 'Minimalist',
            color: selectedStyle == 'Minimalist Style'
                ? BaseColors.primaryColor
                : Colors.grey,
          ),
          ItemTypecategory(
            onTap: () {
              setState(() {
                selectedStyle = 'Japandi Style';
              });
            },
            title: 'Japandi',
            color: selectedStyle == 'Japandi Style'
                ? BaseColors.primaryColor
                : Colors.grey,
          ),
          ItemTypecategory(
            onTap: () {
              setState(() {
                selectedStyle = 'Poho Style';
              });
            },
            title: 'Poho',
            color: selectedStyle == 'Poho Style'
                ? BaseColors.primaryColor
                : Colors.grey,
          ),
        ],
      ),
    );
  }

  Padding FirstLineStyles() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ItemTypecategory(
            onTap: () {
              setState(() {
                selectedStyle = 'Modern';
              });
            },
            title: 'Modern',
            color: selectedStyle == 'Modern'
                ? BaseColors.primaryColor
                : Colors.grey,
          ),
          ItemTypecategory(
            onTap: () {
              setState(() {
                selectedStyle = 'Classic Style';
              });
            },
            title: 'Classic',
            color: selectedStyle == 'Classic Style'
                ? BaseColors.primaryColor
                : Colors.grey,
          ),
          ItemTypecategory(
            onTap: () {
              setState(() {
                selectedStyle = 'Art Deco Style';
              });
            },
            title: 'Art Deco',
            color: selectedStyle == 'Art Deco Style'
                ? BaseColors.primaryColor
                : Colors.grey,
          ),
        ],
      ),
    );
  }

  Padding SecondLineCategory() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ItemTypecategory(
            onTap: () {
              setState(() {
                selectedCategory = AppString.Kitchen;
              });
            },
            title: AppString.Kitchen,
            color: selectedCategory == AppString.Kitchen
                ? BaseColors.primaryColor
                : Colors.grey,
          ),
          ItemTypecategory(
            onTap: () {
              setState(() {
                selectedCategory = AppString.kids;
              });
            },
            title: AppString.kids,
            color: selectedCategory == AppString.kids
                ? BaseColors.primaryColor
                : Colors.grey,
          ),
        ],
      ),
    );
  }

  Padding FirstLineCategory() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ItemTypecategory(
            onTap: () {
              setState(() {
                selectedCategory = AppString.bedroom;
              });
            },
            title: AppString.bedroom,
            color: selectedCategory == AppString.bedroom
                ? BaseColors.primaryColor
                : Colors.grey,
          ),
          ItemTypecategory(
            onTap: () {
              setState(() {
                selectedCategory = AppString.livingRoom;
              });
            },
            title: AppString.livingRoom,
            color: selectedCategory == AppString.livingRoom
                ? BaseColors.primaryColor
                : Colors.grey,
          ),
          ItemTypecategory(
            onTap: () {
              setState(() {
                selectedCategory = AppString.bathroom;
              });
            },
            title: AppString.bathroom,
            color: selectedCategory == AppString.bathroom
                ? BaseColors.primaryColor
                : Colors.grey,
          ),
        ],
      ),
    );
  }
}
