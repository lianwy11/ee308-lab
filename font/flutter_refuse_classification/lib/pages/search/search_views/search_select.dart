import 'package:flutter/material.dart';
import 'package:flutter_refuse_classification/pages/search/search_views/search_hazardous_waste.dart';
import 'package:flutter_refuse_classification/pages/search/search_views/search_kitchen_waste.dart';
import 'package:flutter_refuse_classification/pages/search/search_views/search_other_rubbish_row.dart';
import 'package:flutter_refuse_classification/pages/search/search_views/search_recycling_bar.dart';
import 'package:get/get.dart';

class search_select extends Container {
  search_select()
      : super(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.grey[300] as Color)),
            width: Get.width - 40,
            height: 9 / 24 * Get.height,
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                      height: 3 / 40 * Get.height,
                    ),
                    Text(
                      "垃圾种类",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: Colors.black54),
                    )
                  ],
                ),
                //
                search_recycling_bar(),
                Container(
                  width: 3 / 4 * Get.width,
                  height: 1,
                  color: Colors.grey[200],
                ),
                search_other_rubbish_row(),
                Container(
                  width: 3 / 4 * Get.width,
                  height: 1,
                  color: Colors.grey[200],
                ),
                search_kitchen_waste(),
                Container(
                  width: 3 / 4 * Get.width,
                  height: 1,
                  color: Colors.grey[200],
                ),
                search_hazardous_waste(),
              ],
            ));
}
