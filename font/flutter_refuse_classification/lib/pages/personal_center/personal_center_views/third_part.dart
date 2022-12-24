import 'package:flutter/material.dart';
import 'package:flutter_refuse_classification/pages/personal_center/personal_center_views/row_button.dart';
import 'package:get/get.dart';

class third_part extends Align {
  third_part()
      : super(
            alignment: Alignment(0, 0.05),
            child: Container(
              height: 3 / 18 * Get.height,
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
                  row_button(
                    text: '我的活动',
                    icon: Icons.local_activity_outlined,
                  ),
                  Container(
                    width: 5 / 6 * Get.width - 30,
                    height: 1,
                    color: Colors.grey[200],
                  ),
                  row_button(
                    text: '我的订单',
                    icon: Icons.assignment_outlined,
                  ),
                  Container(
                    width: 5 / 6 * Get.width - 30,
                    height: 1,
                    color: Colors.grey[200],
                  ),
                  row_button(
                    text: '我的兑换',
                    icon: Icons.loyalty_outlined,
                  ),
                ],
              ),
            ));
}
