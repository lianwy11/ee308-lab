import 'package:flutter/material.dart';
import 'package:flutter_refuse_classification/config/icon/icon_data.dart';
import 'package:get/get.dart';

class community_third_part extends Container {
  static String url =
      "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg2.tbcdn.cn%2Ftfscom%2Fi1%2FTB1iiRJQVXXXXa5aXXXXXXXXXXX_%21%210-item_pic.jpg_310x310.jpg&refer=http%3A%2F%2Fimg2.tbcdn.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1646809779&t=49c7a06f685889b6a2246cc1a2f0207c";

  community_third_part()
      : super(
          child: Stack(
            children: [
              //卖主
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(AppIcon.person_center),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "番茄炒蛋",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
              ),

              //买到了
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "买到了",
                    style: TextStyle(color: Colors.orange, fontSize: 14),
                  ),
                ),
              ),

              //产品信息
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                          child: Container(
                            width: 1 / 10 * Get.height - 5,
                            height: 1 / 10 * Get.height - 5,
                            decoration: BoxDecoration(
                                image:
                                    DecorationImage(image: NetworkImage(url)),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              width: 1 / 2 * Get.width,
                              child: Text(
                                "动感单车家用静音智能游戏APP全包轮健身燃脂,动感单车家用静音智能游戏APP全包轮健身燃脂",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text("实付：1590"),
                          ),
                        )
                      ],
                    ),

                    //
                    width: double.infinity,
                    height: 1 / 10 * Get.height,

                    decoration: BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: Colors.grey[200] as Color))),
                  ),
                ),
              ),

              //下边一行按钮
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("更多"),
                    TextButton(onPressed: () {}, child: Text("删除订单")),
                    TextButton(onPressed: () {}, child: Text("联系卖家")),
                  ],
                ),
              )
            ],
          ),
          //边框
          height: 1 / 5 * Get.height,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: 2,
                  color: Colors.grey[400] as Color,
                  offset: Offset(0, 1))
            ],
            color: Colors.white,
            borderRadius: new BorderRadius.circular((10.0)),
          ),
        );
}
