import 'package:flutter/material.dart';
import 'package:flutter_refuse_classification/config/routers/RouteConfig.dart';
import 'package:flutter_refuse_classification/pages/search/search_views/search_select_row.dart';
import 'package:get/get.dart';

class search_hazardous_waste extends Container {
  search_hazardous_waste()
      : super(
          child: search_select_row(
            image: "images/04有害垃圾.png",
            title: "有害垃圾",
            onPressed: () {
              Get.toNamed(RouteConfig.hazardous_waste);
            },
          ),
        );
}
