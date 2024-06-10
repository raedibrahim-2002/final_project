import 'dart:ui';
import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UnSignedChat2 extends StatefulWidget {
  const UnSignedChat2({super.key});

  @override
  State<UnSignedChat2> createState() => _UnSignedChat2State();
}

class _UnSignedChat2State extends State<UnSignedChat2> {
  List Chat = [];
  TextEditingController text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
                child: Text("You Have To Sign In".tr,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontSize: 20))),
            content: Text(
                "Please go back to sign in to view the full details and interact."
                    .tr,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 15)),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFF1D2046), // لون الخلفية
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // حواف دائرية
                  ),
                ),
                child: Text(
                  "OK",
                  style: TextStyle(color: Colors.white), // لون النص
                ),
              ),
            ],
          );
        },
      );
    });

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
              "16".tr,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: Chat.length,
                    itemBuilder: (_, index) => BubbleSpecialThree(
                      text: Chat[index].toString(),
                      color: const Color(0xFF1D2046),
                      tail: true,
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  color: const Color.fromARGB(255, 255, 255, 255),
                  height: 100,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: text,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              Chat.add(text.text);
                              text.text = "";
                            });
                          },
                          icon: const Icon(
                            Icons.send,
                            color: Color(0xFF1D2046),
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 80,
                )
              ],
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
