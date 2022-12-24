import 'package:flutter/material.dart';
import 'package:flutter_refuse_classification/config/icon/icon_data.dart';
import 'package:get/get.dart';

class main_info_part extends Align {
  main_info_part()
      : super(
          child: Container(
            child: Stack(
              children: [
                //定位
                Align(
                  child: Container(
                    width: 1 / 3 * Get.width,
                    child: Row(
                      children: [
                        Icon(AppIcon.location),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '江苏.南京',
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: "App",
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  alignment: Alignment(-0.75, 0.5),
                ),
                //名字
                Align(
                  child: Container(
                    child: Row(
                      children: [
                        Text(
                          "杨焕钦",
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: "App",
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          AppIcon.QR_code,
                          color: Colors.grey,
                        )
                      ],
                    ),
                    height: 1 / 12 * Get.height,
                    width: 5 / 12 * Get.width,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.grey[300] as Color, width: 2))),
                  ),
                  alignment: Alignment(0.5, -1),
                ),
                //向右箭头
                Align(
                  child: Icon(
                    AppIcon.right,
                    color: Colors.grey,
                  ),
                  alignment: Alignment.centerRight,
                )
              ],
            ),
            width: 5 / 6 * Get.width,
            height: 1 / 6 * Get.height,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 2, color: Colors.grey, offset: Offset(0, 1))
              ],
              color: Colors.white,
              borderRadius: new BorderRadius.circular((10.0)),
            ),
          ),
          alignment: Alignment(0, -0.75),
        );
}
