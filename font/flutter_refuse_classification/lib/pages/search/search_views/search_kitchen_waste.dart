import 'package:flutter/material.dart';
import 'package:flutter_refuse_classification/config/routers/RouteConfig.dart';
import 'package:flutter_refuse_classification/pages/search/search_views/search_select_row.dart';
import 'package:get/get.dart';

class search_kitchen_waste extends Container {
  search_kitchen_waste()
      : super(
          child: search_select_row(
            image: "images/03厨余垃圾.png",
            title: "厨余垃圾",
            onPressed: () {
              Get.toNamed(RouteConfig.kitchen_waste);
            },
          ),
        );
}
