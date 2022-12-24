import 'package:flutter/material.dart';
import 'package:get/get.dart';

class news_part extends StatefulWidget {
  String title;
  String publisher;
  String time;
  String picture;

  news_part(
      {Key? key,
      required this.title,
      required this.picture,
      required this.publisher,
      required this.time})
      : super(key: key);

  @override
  State<news_part> createState() => _news_partState();
}

class _news_partState extends State<news_part> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          //图片
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              child: Image.asset(widget.picture),
              height: 1 / 8 * Get.height - 10,
              width: 3 / 2 * (1 / 8 * Get.height - 10),
              color: Colors.grey,
            ),
          ),

          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 1 / 8 * Get.height - 10,
              width: 1 / 2 * Get.width,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      widget.title,
                      style: TextStyle(fontSize: 17),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      widget.publisher + " " + widget.time,
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      height: 1 / 8 * Get.height,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.grey))),
    );
  }
}
