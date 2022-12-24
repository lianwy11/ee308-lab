import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_7.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:get/get.dart';

class send_message extends ChatBubble {
  final Widget? child;
  send_message({required this.child})
      : super(
          backGroundColor: Colors.lightBlue,
          clipper: ChatBubbleClipper7(type: BubbleType.sendBubble, radius: 10),
          child: child,
        );
}

class send extends StatelessWidget {
  final Widget? child;
  const send({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          send_message(child: child),
          SizedBox(width: 5),
          ClipOval(
            //圆形头像
            child: new Image.network(
              'https://pic2.zhimg.com/v2-639b49f2f6578eabddc458b84eb3c6a1.jpg',
              width: 40,
            ),
          ),
        ],
      ),
    );
  }
}
