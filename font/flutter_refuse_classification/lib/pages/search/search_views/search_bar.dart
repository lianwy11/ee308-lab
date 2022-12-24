import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_refuse_classification/config/icon/icon_data.dart';
import 'package:flutter_refuse_classification/config/routers/RouteConfig.dart';
import 'package:flutter_refuse_classification/pages/search/search_models/search_rubbish.dart';
import 'package:flutter_refuse_classification/pages/search/search_provides/search_loction.dart';
import 'package:get/get.dart';

class search_bar extends Container {
  String loction;
  TextEditingController controller;
  FocusNode focusNode = FocusNode();
  search_bar(
      {required this.loction,
      required this.controller,
      required this.focusNode})
      : super(
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey[400] as Color),
                borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(30), left: Radius.circular(30))),

            //
            child: Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                TextButton(
                    onPressed: openModalBottomSheet,
                    child: Text(
                      loction,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    )),
                Icon(
                  AppIcon.down,
                  size: 9,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Container(
                    width: 1,
                    height: 18,
                    color: Colors.grey,
                  ),
                ),

                //文本框
                Expanded(
                    child: TextField(
                  controller: controller,
                  focusNode: focusNode,
                  //
                  style: TextStyle(fontSize: 18, height: 1.5),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 3, top: 3),
                    hintText: "请输入要搜索的垃圾",
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder:
                        OutlineInputBorder(borderSide: BorderSide.none),
                    enabledBorder:
                        OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                )),
                IconButton(
                    onPressed: () {
                      get_refuse_classification_from_text(controller.text);
                      controller.text = '';
                    },
                    icon: Icon(AppIcon.Search))
              ],
            ));
}

//搜索
get_refuse_classification_from_text(String refuse) async {
  var respone = await Dio().get(
      "http://101.132.45.41:8089/GarbageClassification/identifyText?GarbageName=${refuse}");
  print('--------------------------------');
  print(respone);
  print('--------------------------------');

  var result = SearchRubbish.fromJson(respone.data);
  switch (result.Category) {
    case "可回收垃圾":
      {
        Get.toNamed(RouteConfig.recycling);
      }
      break;

    case "有害垃圾":
      {
        Get.toNamed(RouteConfig.hazardous_waste);
      }
      break;

    case "有害垃圾":
      {
        Get.toNamed(RouteConfig.hazardous_waste);
      }
      break;

    case "湿垃圾":
      {
        Get.toNamed(RouteConfig.kitchen_waste);
      }
      break;

    default:
      {
        Get.toNamed(RouteConfig.other_rubbish);
      }
      break;
  }
}

//底部弹窗
openModalBottomSheet() {
  //数据
  List<String> city = [
    "国标",
    "北京市",
    "上海市",
    "重庆市",
    "石家庄",
    "邯郸市",
    "太原市",
  ];

  //地址
  final search_loction loc = Get.put(search_loction());

  //底部弹窗
  Get.bottomSheet(Container(
    color: Colors.white,
    height: 400.0,
    child: Column(
      children: <Widget>[
        //标题
        Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            "请选择城市",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
        Container(
          width: 3 / 4 * Get.width,
          height: 1,
          color: Colors.grey,
        ),
        //选择模块
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(city[index], textAlign: TextAlign.center),
                onTap: () {
                  loc.change(city[index]);
                  Get.back();
                },
              );
            },
            itemCount: city.length,
          ),
        )
      ],
    ),
  ));
}
