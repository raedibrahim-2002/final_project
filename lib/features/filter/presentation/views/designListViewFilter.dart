import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_graduation_project/features/details/views/details_view.dart';
import 'package:flutter_final_graduation_project/features/home/cubit/home_cubit.dart';
import 'package:flutter_final_graduation_project/models/design_model/design_model.dart';

class DesignsListView extends StatelessWidget {
  final List<DesignModel> designs;

  const DesignsListView({Key? key, required this.designs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('filtered designs')),
      ),
      body: designs.isEmpty
          ? Center(
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhBXLbaCErzySoQH09QWCzLLZpb7Rc0okbJQ&usqp=CAU',
                fit: BoxFit.fill,
                width: double.infinity,
                height: double.infinity,
              ),
            )
          : BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                final cubit = BlocProvider.of<HomeCubit>(context);
                return GridView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio:
                        (MediaQuery.of(context).size.width - 15 - 15) /
                            (2 * 253),
                    crossAxisSpacing: 10,
                  ),
                  itemCount: designs.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Container(
                              height: MediaQuery.of(context).size.height * .22,
                              child: Stack(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return DetailsScreen(
                                                design: designs[index]);
                                          },
                                        ),
                                      );
                                    },
                                    child: Image.network(
                                      designs[index]
                                          .pictures!
                                          .first
                                          .pictureUrl
                                          .toString(),
                                      fit: BoxFit.fill,
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
                                              BorderRadius.circular(20),
                                        ),
                                        child: GestureDetector(
                                          onTap: () {
                                            cubit.toggleFavoriteStatus(
                                                designs[index]);
                                          },
                                          child: Icon(
                                            Icons.favorite_outlined,
                                            size: 25,
                                            color: cubit.favoriteDesigns
                                                    .contains(designs[index])
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
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, top: 2),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      maxLines: 1,
                                      overflow: TextOverflow.fade,
                                      designs[index].name.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    ),
                                    const SizedBox(height: 2),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: Text(
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        designs[index].description.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
