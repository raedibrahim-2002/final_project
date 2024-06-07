// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_final_graduation_project/core/utils/assets.dart';
// import 'package:flutter_final_graduation_project/core/utils/colors.dart';
// import 'package:flutter_final_graduation_project/core/utils/styles.dart';
// import 'package:flutter_final_graduation_project/features/categories/presentation/views/category_view.dart';
// import 'package:flutter_final_graduation_project/features/filter/presentation/views/widgets/item_type_category.dart';
// import 'package:flutter_final_graduation_project/features/room/presentaiton/views/room_view.dart';
// class FilterScreen extends StatelessWidget {
//   const FilterScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         elevation: 0,
//         title: Text(
//           'Filter',
//           style: getMediumTextStyleInter(
//             color: BaseColors.blackColor,
//             fontSize: 20,
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Text(
//                   AppString.category,
//                   style: getMediumTextStyleInter(
//                     color: BaseColors.blackColor,
//                     fontSize: 20,
//                   ),
//                 ),
//                 Spacer(),
//                 Text(
//                   'View all',
//                   style: getMediumTextStyleInter(
//                     color: BaseColors.blackColor,
//                     fontSize: 15,
//                   ),
//                 ),
//                 IconButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) {
//                           return CategoryView();
//                         },
//                       ),
//                     );
//                   },
//                   icon: Icon(CupertinoIcons.chevron_right),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//               child: Divider(
//                 color: BaseColors.grey,
//               ),
//             ),
//             Text('Type'),
//             const SizedBox(
//               height: 16,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ItemTypecategory(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) {
//                             return RoomView(roomTitle: 'Bed Room');
//                           },
//                         ),
//                       );
//                     },
//                     title: AppString.bedroom,
//                     color: BaseColors.primaryColor,
//                   ),
//                   ItemTypecategory(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) {
//                             return RoomView(roomTitle: 'Living Room');
//                           },
//                         ),
//                       );
//                     },
//                     title: AppString.livingRoom,
//                     color: BaseColors.primaryColor,
//                   ),
//                   ItemTypecategory(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) {
//                             return RoomView(roomTitle: 'Bath Room');
//                           },
//                         ),
//                       );
//                     },
//                     title: AppString.bathroom,
//                     color: BaseColors.primaryColor,
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ItemTypecategory(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) {
//                             return RoomView(roomTitle: 'Kitchen Room');
//                           },
//                         ),
//                       );
//                     },
//                     title: AppString.Kitchen,
//                     color: BaseColors.primaryColor,
//                   ),
 
//                   ItemTypecategory(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) {
//                             return RoomView(roomTitle: 'Kids Room');
//                           },
//                         ),
//                       );
//                     },
//                     title: AppString.kids,
//                     color: BaseColors.primaryColor,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
