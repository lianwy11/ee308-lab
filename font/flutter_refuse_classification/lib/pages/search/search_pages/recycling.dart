import 'package:flutter/material.dart';
import 'package:flutter_refuse_classification/pages/search/search_views/search_appbar.dart';

class recycling_page extends StatefulWidget {
  recycling_page({Key? key}) : super(key: key);

  @override
  State<recycling_page> createState() => _recycling_pageState();
}

class _recycling_pageState extends State<recycling_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: search_appbar(),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("images/可回收物.png"),
          fit: BoxFit.contain,
        )),
      ),
    );
  }
}
