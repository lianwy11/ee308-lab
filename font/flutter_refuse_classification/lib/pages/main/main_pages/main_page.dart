import 'package:flutter/material.dart';
import 'package:flutter_refuse_classification/config/color/color_date.dart';
import 'package:flutter_refuse_classification/config/icon/icon_data.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter_refuse_classification/pages/community/community_pages/community_page.dart';
import 'package:flutter_refuse_classification/pages/discover/discover_pages/discover_page.dart';
import 'package:flutter_refuse_classification/pages/home/home_pages/home_page.dart';
import 'package:flutter_refuse_classification/pages/main/main_views/global_hover_button.dart';
import 'package:flutter_refuse_classification/pages/personal_center/personal_center_page/personal_center_page.dart';
import 'package:flutter_refuse_classification/pages/search/search_pages/search_page.dart';
import 'package:get/get.dart';

class main_page extends StatefulWidget {
  main_page({Key? key}) : super(key: key);

  @override
  _main_pageState createState() => _main_pageState();
}

class _main_pageState extends State<main_page> {
  List _body_list = [
    home_page(),
    discover_page(),
    search_page(),
    community_page(),
    personal_center_page()
  ];

  int _index = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //浮动按钮
      body: Stack(
        children: [
          Center(
            child: _body_list[_index],
          ),
          global_hover_button(offset: Offset(230, 160))
        ],
      ),

      //页面
      bottomNavigationBar: ConvexAppBar(
          style: TabStyle.reactCircle,
          activeColor: AppColor.AppColorPrimary,
          backgroundColor: Colors.white,
          color: Colors.grey,
          items: [
            TabItem(
                icon: Icon(AppIcon.home_page, color: Colors.grey),
                activeIcon: Icon(AppIcon.home_page, color: Colors.white),
                title: '首页'),
            TabItem(
                icon: Icon(AppIcon.find, color: Colors.grey),
                activeIcon: Icon(AppIcon.find, color: Colors.white),
                title: '发现'),
            TabItem(
                icon: Icon(AppIcon.Search, color: Colors.grey),
                activeIcon: Icon(AppIcon.Search, color: Colors.white),
                title: '搜索'),
            TabItem(
                icon: Icon(AppIcon.community, color: Colors.grey),
                activeIcon: Icon(
                  AppIcon.community,
                  color: Colors.white,
                ),
                title: '社区'),
            TabItem(
                icon: Icon(AppIcon.person_center, color: Colors.grey),
                activeIcon: Icon(AppIcon.person_center, color: Colors.white),
                title: '我的')
          ],
          initialActiveIndex: 2, //optional, default as 0
          onTap: (int i) => setState(() {
                _index = i;
              })),
    );
  }
}
