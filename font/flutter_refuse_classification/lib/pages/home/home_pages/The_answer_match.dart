import 'package:flutter/material.dart';
import 'package:flutter_refuse_classification/config/color/color_date.dart';

class match_page extends StatefulWidget {
  match_page({Key? key}) : super(key: key);

  @override
  State<match_page> createState() => _match_pageState();
}

class _match_pageState extends State<match_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.Match,
        title: Text('圾分竞答'),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/积分竞答.png'), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
