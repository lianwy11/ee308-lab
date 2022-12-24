// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter_refuse_classification/config/routers/RouteConfig.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';

class home_swiper extends StatefulWidget {
  home_swiper({Key? key}) : super(key: key);

  @override
  State<home_swiper> createState() => _home_swiperState();
}

class _home_swiperState extends State<home_swiper> {
  List<String> _images = [
    'images/轮播图01.png',
    'images/轮播图02.jpg',
    'images/轮播图03.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1 / 5 * Get.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      //轮播图
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Get.toNamed(RouteConfig.match);
            },
            //图片
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  image: DecorationImage(
                      image: AssetImage(_images[index]), fit: BoxFit.cover)),
            ),
          );
        },
        autoplay: true,
        itemCount: _images.length,
        pagination: new SwiperPagination(),
      ),
    );
  }
}
