import 'package:flutter/material.dart';
import 'package:flutter_refuse_classification/pages/search/search_views/search_appbar.dart';

class kitchen_waste_page extends StatefulWidget {
  kitchen_waste_page({Key? key}) : super(key: key);

  @override
  State<kitchen_waste_page> createState() => _kitchen_waste_pageState();
}

class _kitchen_waste_pageState extends State<kitchen_waste_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: search_appbar(),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("images/厨余垃圾.png"),
          fit: BoxFit.contain,
        )),
      ),
    );
  }
}
