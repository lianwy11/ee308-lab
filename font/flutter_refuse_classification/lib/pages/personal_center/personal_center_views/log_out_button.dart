import 'package:flutter/material.dart';
import 'package:flutter_refuse_classification/config/color/color_date.dart';
import 'package:get/get.dart';

class log_out_button extends Align {
  log_out_button()
      : super(
            alignment: Alignment(0, 0.9),
            child: GestureDetector(
              child: Container(
                child: Center(
                  child: Text("退出登录",
                      style: TextStyle(
                          fontSize: 16, color: AppColor.AppColorPrimary)),
                ),
                height: 1 / 18 * Get.height,
                width: 5 / 6 * Get.width,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 2, color: Colors.grey, offset: Offset(0, 1))
                  ],
                  color: Colors.white,
                  borderRadius: new BorderRadius.circular((5.0)),
                ),
              ),
            ));
}
