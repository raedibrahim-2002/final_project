import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';

import 'Const_chat.dart';

class ChatView extends StatefulWidget {
  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  TextEditingController text= TextEditingController();

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
              "Chat",
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
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
           Expanded(
             child: ListView.builder(
              itemCount:Chat.length ,
              itemBuilder: (_,index)=>  ChatBubble(
              clipper: ChatBubbleClipper1(type: BubbleType.sendBubble),
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(top: 20),
              backGroundColor: Color(0xFF1D2046),
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                ),
                child: Text(Chat[index].toString(),
                  style: TextStyle(color: Colors.white,fontSize: 20),
                ),
              ),
                       ),),
           ),
            Container(
              padding: EdgeInsets.all(15),
              color: Colors.white,
              height: 100,
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
                  IconButton(onPressed: (){
                    setState(() {
                      Chat.add(text.text);
                      text.text="";
                    });
                  }, icon: Icon(Icons.send,color: Color(0xFF1D2046),))
                ],
              ),
            ),
        ],
        )
      ),
    );
  }
}

