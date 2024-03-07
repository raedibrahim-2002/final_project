import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({super.key});
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width * .2,
            ),
            Text(
              "Search",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Spacer(),
            Row(
              children: [
                Stack(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(CupertinoIcons.heart)), // أيقونة القلب
                    Positioned(
                      top: 13,
                      right: 10,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(CupertinoIcons.bell),
                ),
              ],
            ),
          ],
        ),
      ),


      body:

      Padding(
        padding: EdgeInsets.all(10),
        child: TextFormField(
        
          controller: searchController,
        
          onFieldSubmitted: (String value )
          {
            print(value);
          },
          onChanged: (String value )
          {
            print(value);
          },
        
          decoration: InputDecoration(
            filled:true ,
            fillColor: Colors.black12,
            labelText: "search",
            prefixIcon:const Icon(
              Icons.search,
            ) ,

            suffixIcon: IconButton(
              icon: Icon(CupertinoIcons.slider_horizontal_3),
              onPressed: () {
              },
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
          ) ,
        
        ),
      ),
    );
  }
}
