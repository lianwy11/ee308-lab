import 'package:flutter/material.dart';
import 'package:flutter_refuse_classification/pages/discover/discover_views/discover_appbar.dart';
import 'package:flutter_refuse_classification/pages/home/home_views/find_site_button.dart';
import 'package:flutter_refuse_classification/pages/home/home_views/home_photograph_button.dart';
import 'package:flutter_refuse_classification/pages/home/home_views/home_swiper.dart';
import 'package:flutter_refuse_classification/pages/home/home_views/record_button.dart';
import 'package:flutter_refuse_classification/pages/home/home_views/scan%20_QRcodes.dart';
import 'package:flutter_refuse_classification/pages/home/home_views/shop_button.dart';

class home_page extends StatefulWidget {
  home_page({Key? key}) : super(key: key);

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: discover_appbar(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Stack(
          children: [
            Align(
              child: home_swiper(),
              alignment: Alignment.topCenter,
            ),
            Align(
              child: home_photograph_button(),
              alignment: Alignment(0, -0.35),
            ),
            Align(
              child: find_site_button(),
              alignment: Alignment(-1, 0.2),
            ),
            Align(
              child: scan_QRcodes(),
              alignment: Alignment(1, 0.025),
            ),
            Align(
              child: record_button(),
              alignment: Alignment(-1, 0.7),
            ),
            Align(
              child: shop_button(),
              alignment: Alignment(1, 0.65),
            )
          ],
        ),
      ),
    );
  }
}
