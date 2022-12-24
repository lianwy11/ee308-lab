import 'package:flutter/material.dart';
import 'package:get/get.dart';

class head_portrait extends Align {
  head_portrait()
      : super(
          child: Container(
            height: 1 / 10 * Get.height,
            width: 1 / 10 * Get.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://avatar.csdn.net/8/9/A/3_chenlove1.jpg"),
                    fit: BoxFit.fill),
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)],
                border: Border.all(color: Colors.white, width: 3),
                shape: BoxShape.circle),
          ),
          alignment: Alignment(-0.6, -0.83),
        );
}
