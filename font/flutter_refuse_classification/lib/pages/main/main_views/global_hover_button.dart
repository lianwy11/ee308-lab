import 'package:flutter/material.dart';
import 'package:flutter_refuse_classification/config/routers/RouteConfig.dart';
import 'package:get/get.dart';

class global_hover_button extends StatefulWidget {
  final Offset offset;

  global_hover_button({Key? key, required this.offset}) : super(key: key);

  @override
  State<global_hover_button> createState() => _global_hover_buttonState();
}

class _global_hover_buttonState extends State<global_hover_button> {
  Offset offset = Offset(0.0, 0.0);
  @override
  void initState() {
    super.initState();
    offset = widget.offset;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: offset.dx,
      top: offset.dy,
      child: LongPressDraggable(
        child: MaterialButton(
          onPressed: () {
            Get.toNamed(RouteConfig.chat);
          },
          child: Image.asset(
            'images/ai机器人.png',
            width: 100,
            height: 100,
          ),
        ),
        feedback: Image.asset(
          'images/ai机器人.png',
          width: 100,
          height: 100,
        ),
        childWhenDragging: Container(),
        onDragEnd: (details) {
          offset = details.offset;
          setState(() {});
        },
      ),
    );
  }
}
