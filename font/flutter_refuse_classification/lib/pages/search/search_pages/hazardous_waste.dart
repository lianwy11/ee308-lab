import 'package:flutter/material.dart';
import 'package:flutter_refuse_classification/pages/search/search_views/search_appbar.dart';

class hazardous_waste_page extends StatefulWidget {
  hazardous_waste_page({Key? key}) : super(key: key);

  @override
  State<hazardous_waste_page> createState() => _hazardous_waste_pageState();
}

class _hazardous_waste_pageState extends State<hazardous_waste_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: search_appbar(),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("images/有害垃圾.png"),
          fit: BoxFit.contain,
        )),
      ),
    );
  }
}
