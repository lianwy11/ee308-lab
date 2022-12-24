import 'package:flutter/material.dart';
import 'package:flutter_refuse_classification/config/color/color_date.dart';
import 'package:get/get.dart';

class background_view extends Positioned {
  background_view()
      : super(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColor.Appbar_Start, AppColor.Appbar_end],
              ),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
            ),
          ),
          left: 0,
          right: 0,
          top: 0,
          bottom: Get.height * 15 / 20,
        );
}
