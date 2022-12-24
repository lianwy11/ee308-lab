import 'package:flutter/material.dart';
import 'package:flutter_refuse_classification/pages/discover/discover_views/second_discover_part.dart';

class second_discover_listview extends ListView {
  second_discover_listview()
      : super.builder(
            itemCount: videos.length,
            itemBuilder: (context, index) {
              //////////
              return Padding(
                padding: EdgeInsets.all(10),
                child: videos[index],
              );
              //////////
            });
}

List<video> videos = [
  video(
      title: '直播回顾|“2021环保产业创新发展大会”主论坛',
      picture: 'images/视频1.png',
      picturePlay: 'images/视频01.png',
      time: '86万次观看 7月13日'),
  video(
      title: '携手应对气候变化挑战 合力保护人类地球家园',
      picture: 'images/视频2.png',
      picturePlay: 'images/视频02.jpg',
      time: '64万次观看 11月2日')
];
