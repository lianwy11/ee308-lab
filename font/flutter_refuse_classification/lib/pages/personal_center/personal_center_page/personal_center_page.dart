import 'package:flutter/material.dart';
import 'package:flutter_refuse_classification/pages/personal_center/personal_center_views/background_view.dart';
import 'package:flutter_refuse_classification/pages/personal_center/personal_center_views/fourth_part.dart';
import 'package:flutter_refuse_classification/pages/personal_center/personal_center_views/head_portrait.dart';
import 'package:flutter_refuse_classification/pages/personal_center/personal_center_views/log_out_button.dart';
import 'package:flutter_refuse_classification/pages/personal_center/personal_center_views/main_info_part.dart';
import 'package:flutter_refuse_classification/pages/personal_center/personal_center_views/second_part.dart';
import 'package:flutter_refuse_classification/pages/personal_center/personal_center_views/third_part.dart';
import 'package:get/get.dart';

class personal_center_page extends StatefulWidget {
  personal_center_page({Key? key}) : super(key: key);

  @override
  State<personal_center_page> createState() => _personal_center_pageState();
}

class _personal_center_pageState extends State<personal_center_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          background_view(),
          main_info_part(),
          head_portrait(),
          second_part(),
          third_part(),
          fourth_part(),
          log_out_button()
        ],
      ),
    );
  }
}
