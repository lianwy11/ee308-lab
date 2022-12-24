import 'package:flutter/material.dart';
import 'package:flutter_refuse_classification/pages/search/search_views/search_appbar.dart';

class other_rubbish_page extends StatefulWidget {
  other_rubbish_page({Key? key}) : super(key: key);

  @override
  State<other_rubbish_page> createState() => _other_rubbish_pageState();
}

class _other_rubbish_pageState extends State<other_rubbish_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: search_appbar(),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("images/其他垃圾.png"),
          fit: BoxFit.contain,
        )),
      ),
    );
  }
}
