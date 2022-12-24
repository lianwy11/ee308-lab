import 'package:flutter/material.dart';
import 'package:flutter_refuse_classification/pages/discover/discover_views/first_discover_part.dart';

class first_discover_listview extends ListView {
  first_discover_listview()
      : super.builder(
            itemCount: news.length,
            itemBuilder: (context, index) {
              //////////
              return Padding(
                padding: EdgeInsets.all(10),
                child: news[index],
              );
              //////////
            });
}

List<news_part> news = [
  news_part(
      title: "全国政协委员王丽萍：建议旧口罩纳入垃圾分类管理",
      picture: "images/精选01.jpg",
      publisher: "央视新闻",
      time: "2022-03-05"),
  news_part(
      title: "收运处置“全链闭环”，无锡多措并举推进垃圾分类",
      picture: "images/精选02.png",
      publisher: "无锡观察",
      time: "2022-03-05"),
  news_part(
      title: "让垃圾分类成为人们行动自觉",
      picture: "images/精选03.png",
      publisher: "齐鲁网",
      time: "2022-03-02"),
  news_part(
      title: "生态环境部举行2月例行新闻发布会",
      picture: "images/精选04.png",
      publisher: "生态环境部",
      time: "2022-03-23"),
  news_part(
      title: "生态环境部发布2022年六五环境日主题“共建清洁美丽世界”",
      picture: "images/精选05.png",
      publisher: "生态环境部",
      time: "2022-03-23"),
];
