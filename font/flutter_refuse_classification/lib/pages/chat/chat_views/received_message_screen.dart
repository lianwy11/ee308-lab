import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_7.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';

class received_message extends ChatBubble {
  final Widget? child;
  received_message({required this.child})
      : super(
          backGroundColor: Colors.white,
          clipper:
              ChatBubbleClipper7(type: BubbleType.receiverBubble, radius: 10),
          child: child,
        );
}

class received extends StatelessWidget {
  final Widget? child;
  const received({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipOval(
            //圆形头像
            child: new Image.asset(
              'images/ai机器人2.png',
              fit: BoxFit.cover,
              width: 40,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          received_message(child: child)
        ],
      ),
    );
  }
}
