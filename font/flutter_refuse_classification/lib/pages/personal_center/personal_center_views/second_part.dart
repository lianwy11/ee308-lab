import 'package:flutter/material.dart';
import 'package:flutter_refuse_classification/config/color/color_date.dart';
import 'package:flutter_refuse_classification/config/icon/icon_data.dart';
import 'package:get/get.dart';

class second_part extends Align {
  second_part()
      : super(
            alignment: Alignment(0, -0.32),
            child: Container(
              height: 1 / 12 * Get.height,
              width: 5 / 6 * Get.width,
              child: Row(
                children: [
                  //左边：积分值

                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      AppIcon.leaf,
                                      size: 17,
                                    ),
                                    Text(
                                      "我的",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: "App",
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Text(
                                  "圾分值",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "App",
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          flex: 1,
                        ),
                        SizedBox(
                          width: 2,
                          height: 1 / 24 * Get.height + 5,
                          child: Container(color: Colors.grey),
                        ),
                        Expanded(
                          child: Container(
                            child: Center(
                              child: Text(
                                "628",
                                style: TextStyle(
                                    fontSize: 28,
                                    fontFamily: "App",
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.AppColorPrimary),
                              ),
                            ),
                          ),
                          flex: 1,
                        )
                      ],
                    ),
                    width: 9 / 24 * Get.width,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 2,
                            color: Colors.grey,
                            offset: Offset(0, 1))
                      ],
                      color: Colors.white,
                      borderRadius: new BorderRadius.circular((10.0)),
                    ),
                  ),

                  SizedBox(
                    width: 1 / 12 * Get.width,
                  ),

                  //右边：我的社区
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Center(
                              child: Text(
                                "我的社区",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "App",
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          flex: 1,
                        ),
                        SizedBox(
                          width: 2,
                          height: 1 / 24 * Get.height + 5,
                          child: Container(color: Colors.grey),
                        ),
                        Expanded(
                          child: Container(
                            child: Center(
                              child: Text(
                                "花园路小区",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "App",
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.AppColorPrimary),
                              ),
                            ),
                          ),
                          flex: 2,
                        )
                      ],
                    ),
                    //
                    width: 9 / 24 * Get.width,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 2,
                            color: Colors.grey,
                            offset: Offset(0, 1))
                      ],
                      color: Colors.white,
                      borderRadius: new BorderRadius.circular((10.0)),
                    ),
                  ),
                ],
              ),
            ));
}
