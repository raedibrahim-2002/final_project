import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/core/utils/assets.dart';
import 'package:flutter_final_graduation_project/features/chat/presentation/views/widgets/chat_view_body.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              SizedBox(
                width: MediaQuery.of(context).size.width * .09,
              ),
              Text(
                AppString.chat,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Spacer(),
              IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.bell_fill))
            ],
          )),
      body: ChatViewBody(),
    );
  }
}
