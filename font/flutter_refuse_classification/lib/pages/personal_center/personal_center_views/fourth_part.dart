import 'package:flutter/material.dart';
import 'package:flutter_refuse_classification/pages/personal_center/personal_center_views/row_button.dart';
import 'package:get/get.dart';

class fourth_part extends Align {
  fourth_part()
      : super(
            alignment: Alignment(0, 0.665),
            child: Container(
              height: 4 / 18 * Get.height,
              width: 5 / 6 * Get.width,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 2, color: Colors.grey, offset: Offset(0, 1))
                ],
                color: Colors.white,
                borderRadius: new BorderRadius.circular((5.0)),
              ),

              //
              child: Column(
                children: [
                  row_button(text: "帮助与反馈", icon: Icons.announcement_outlined),
                  Container(
                    width: 5 / 6 * Get.width - 30,
                    height: 1,
                    color: Colors.grey[200],
                  ),
                  row_button(text: "设置", icon: Icons.settings_outlined),
                  Container(
                    width: 5 / 6 * Get.width - 30,
                    height: 1,
                    color: Colors.grey[200],
                  ),
                  row_button(text: "关于", icon: Icons.description_outlined),
                  Container(
                    width: 5 / 6 * Get.width - 30,
                    height: 1,
                    color: Colors.grey[200],
                  ),
                  row_button(text: "测试", icon: Icons.task_outlined),
                ],
              ),
            ));
}
