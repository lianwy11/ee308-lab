import 'package:flutter/material.dart';
import 'package:flutter_refuse_classification/config/routers/RouteConfig.dart';
import 'package:flutter_refuse_classification/pages/search/search_views/search_select_row.dart';
import 'package:get/get.dart';

class search_recycling_bar extends Container {
  search_recycling_bar()
      : super(
          child: search_select_row(
            image: "images/01可回收物.png",
            title: "可回收物",
            onPressed: () {
              Get.toNamed(RouteConfig.recycling);
            },
          ),
        );
}
