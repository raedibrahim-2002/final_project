import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_final_graduation_project/features/chat/presentation/views/widgets/Const_chat.dart';
import 'package:flutter_final_graduation_project/features/favorite/presentation/view/favorite_view.dart';
import 'package:flutter_final_graduation_project/features/home/presentation/views/notifications_view.dart';
import 'package:flutter_final_graduation_project/models/chat_model.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

class _Chat2_ViewState extends StatefulWidget {
  _Chat2_ViewState({super.key});

  @override
  State<_Chat2_ViewState> createState() => __Chat2_ViewStateState();
}

class __Chat2_ViewStateState extends State<_Chat2_ViewState> {
  TextEditingController text = TextEditingController();
  String myname = 'chat2';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width * .2,
            ),
            Text(
              "Chat 2",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Spacer(),
            Row(
              children: [
                Stack(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return FavoriteView();
                              },
                            ),
                          );
                        },
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return NotificationView();
                        },
                      ),
                    );
                  },
                  icon: Icon(CupertinoIcons.bell),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Container(
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: Chat.length,
                  itemBuilder: (_, index) => BubbleSpecialThree(
                    isSender: Chat[index].sender_name == myname ? true : false,
                    text: Chat[index].text.toString(),
                    color: Chat[index].sender_name == myname
                        ? Color(0xFF1D2046)
                        : Colors.grey,
                    tail: true,
                    textStyle: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                color: Color.fromARGB(255, 255, 255, 255),
                height: 100,
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: text,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            Chat.add(Model_chat(text.text, myname));
                            text.text = "";
                          });
                        },
                        icon: Icon(
                          Icons.send,
                          color: Color(0xFF1D2046),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 80,
              )
            ],
          )),
    );
  }
}
