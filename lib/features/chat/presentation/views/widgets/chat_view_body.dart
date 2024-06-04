import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_final_graduation_project/features/chat/presentation/views/widgets/Const_chat.dart';
import 'package:flutter_final_graduation_project/features/favorite/presentation/view/favorite_view.dart';
import 'package:flutter_final_graduation_project/features/home/presentation/views/notifications_view.dart';
import 'package:flutter_final_graduation_project/models/chat_model.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

class ChatViewBody extends StatefulWidget {
  const ChatViewBody({super.key});

  @override
  State<ChatViewBody> createState() => _ChatViewBodyState();
}

class _ChatViewBodyState extends State<ChatViewBody> {
  TextEditingController text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width * .2,
            ),
            Text(
              "Chat ",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const Spacer(),
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
                                return const FavoriteView();
                              },
                            ),
                          );
                        },
                        icon: const Icon(CupertinoIcons.heart)), // أيقونة القلب
                    Positioned(
                      top: 13,
                      right: 10,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
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
                          return const NotificationView();
                        },
                      ),
                    );
                  },
                  icon: const Icon(CupertinoIcons.bell),
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
          )),
    );
  }
}
