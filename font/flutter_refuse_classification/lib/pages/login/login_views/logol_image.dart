import 'package:flutter/material.dart';

Widget logoImageArea = new Container(
  alignment: Alignment.topCenter,
  // 设置图片为圆形
  child: ClipOval(
    child: Image.asset(
      "images/logo.png",
      height: 100,
      width: 100,
      fit: BoxFit.cover,
    ),
  ),
);
