import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_graduation_project/features/details/views/details_view.dart';
import 'package:flutter_final_graduation_project/features/favorite/presentation/view/favorite_view.dart';
import 'package:flutter_final_graduation_project/features/filter/presentation/views/fiter_view.dart';
import 'package:flutter_final_graduation_project/features/home/cubit/home_cubit.dart';
import 'package:flutter_final_graduation_project/features/home/presentation/views/notifications_view.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .01,
            ),
            Text(
              "Search",
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: TextFormField(
              controller: searchController,
              onFieldSubmitted: (String value) {
                print(value);
              },
              onChanged: (input) {
                cubit.filterProduct(input: input);
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.black12,
                labelText: "search",
                labelStyle:
                    TextStyle(color: Colors.black), // تغيير لون النص إلى الأسود
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.black, // تغيير لون الأيقونة إلى الأسود
                ),
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(20.0), // جعل الحواف دائرية أكثر
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(
                  color: Colors.black), // تغيير لون النص المدخل إلى الأسود
            ),
          ),
          Expanded(
            child: cubit.designs.isEmpty
                ? const CupertinoActivityIndicator()
                : GridView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio:
                          (MediaQuery.of(context).size.width - 15 - 15) /
                              (2 * 255),
                      // mainAxisSpacing: 2,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: cubit.filteredProduct.isEmpty
                        ? cubit.designs.length
                        : cubit.filteredProduct.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Container(
                                // color: Colors.yellow,
                                height:
                                    MediaQuery.of(context).size.height * .22,
                                child: Stack(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return DetailsScreen(
                                                design: cubit.designs[index],
                                              );
                                            },
                                          ),
                                        );
                                      },
                                      child: Image.network(
                                        cubit.filteredProduct.isEmpty
                                            ? cubit.designs[index].pictures!
                                                .first.pictureUrl
                                                .toString()
                                            : cubit.filteredProduct[index]
                                                .pictures!.first.pictureUrl
                                                .toString(),
                                        fit: BoxFit.fill,
                                        // height: double.maxFinite,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .23,
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
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: const Icon(
                                            Icons.favorite_outlined,
                                            size: 25,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 5,
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10.0, top: 2),
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        maxLines: 1,
                                        overflow: TextOverflow.fade,
                                        cubit.filteredProduct.isEmpty
                                            ? cubit.designs[index].name!
                                            : cubit
                                                .filteredProduct[index].name!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall,
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8.0),
                                        child: Text(
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          cubit.filteredProduct.isEmpty
                                              ? cubit
                                                  .designs[index].description!
                                              : cubit.filteredProduct[index]
                                                  .description!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
          )
        ],
      ),
    );
  }
}
