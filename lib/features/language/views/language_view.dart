import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .3,
          ),
          const Image(image: AssetImage("Images/pana.png"),
            height: 350,
            width: 400,
            alignment: Alignment.center,
          ),
       const SizedBox(
         height: 100,
       ),
          Padding(
    padding: const EdgeInsets.all(20),
    child: Row(
      children: [
        Expanded(child:
          
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1D2046),
                  ), onPressed: () {  }
                  , child:  Text('ُEnglish' ,style: Theme.of(context).textTheme.headlineLarge,),
                ),
                ),
              ),

              Expanded(child:
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(

              style:  ElevatedButton.styleFrom(

                 backgroundColor: Color(0xFF1D2046),

                   ), onPressed: () {  }
                  ,  child:  Text('عربي' ,style: Theme.of(context).textTheme.headlineLarge,),
                ),
              ),
              ),
        


    
    ]
  ),
          )
     ]
      )


    );
  }
}