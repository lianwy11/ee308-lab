import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_refuse_classification/config/icon/icon_data.dart';
import 'package:get/get.dart';

class search_select_row extends Row {
  String image;
  String title;
  void Function()? onPressed;

  search_select_row(
      {required this.image, required this.title, required this.onPressed})
      : super(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            height: 9 / 120 * Get.height - 2,
            child: Row(
              children: [
                SizedBox(width: 25),
                Container(
                  height: 5 / 120 * Get.height - 2,
                  width: 5 / 120 * Get.height - 2,
                  child: Image.asset(image),
                ),
                SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              AppIcon.right,
              size: 15,
              color: Colors.grey,
            ),
            onPressed: onPressed,
          ),
        ]);
}
