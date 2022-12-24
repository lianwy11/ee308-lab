import 'package:flutter/material.dart';
import 'package:flutter_refuse_classification/config/routers/RouteConfig.dart';
import 'package:flutter_refuse_classification/pages/search/search_views/search_select_row.dart';
import 'package:get/get.dart';

class search_other_rubbish_row extends Container {
  search_other_rubbish_row()
      : super(
          child: search_select_row(
            image: "images/02其他垃圾.png",
            title: "其他垃圾",
            onPressed: () {
              Get.toNamed(RouteConfig.other_rubbish);
            },
          ),
        );
}
