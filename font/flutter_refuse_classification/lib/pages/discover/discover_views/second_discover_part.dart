import 'package:flutter/material.dart';
import 'package:get/get.dart';

class video extends StatefulWidget {
  String title;
  String picture;
  String picturePlay;
  String time;

  video(
      {Key? key,
      required this.title,
      required this.picture,
      required this.picturePlay,
      required this.time})
      : super(key: key);

  @override
  State<video> createState() => _videoState();
}

class _videoState extends State<video> {
  bool isPlay = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1 / 3 * Get.height,
      child: Column(
        children: [
          GestureDetector(
            child: Container(
              height: 1 / 4 * Get.height,
              width: 9 / 10 * Get.width,
              decoration: BoxDecoration(
                  image: isPlay
                      ? DecorationImage(
                          image: AssetImage(widget.picturePlay),
                          fit: BoxFit.cover)
                      : DecorationImage(
                          image: AssetImage(widget.picture),
                          fit: BoxFit.cover)),
            ),
            onTap: () {
              isPlay = !isPlay;
              setState(() {});
            },
          ),
          Text(
            widget.title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                widget.time,
                style: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
              SizedBox(
                height: 30,
                width: 10,
              )
            ],
          ),
          Container(
            height: 1,
            width: 9 / 10 * Get.width,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
