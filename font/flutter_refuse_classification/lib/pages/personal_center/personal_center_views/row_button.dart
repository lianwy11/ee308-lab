import 'package:flutter/material.dart';
import 'package:flutter_refuse_classification/config/icon/icon_data.dart';
import 'package:get/get.dart';

class row_button extends GestureDetector {
  String text;
  IconData icon;
  row_button({required this.text, required this.icon})
      : super(
            child: Container(
          height: 1 / 18 * Get.height - 1,
          width: 5 / 6 * Get.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10, left: 15),
                      child: Icon(
                        icon,
                        color: Colors.blue[700],
                        size: 18,
                      ),
                    ),
                    Text(
                      text,
                      style: TextStyle(fontSize: 17),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15, left: 10),
                child: Icon(
                  AppIcon.right,
                  color: Colors.grey,
                  size: 15,
                ),
              )
            ],
          ),
        ));
}
