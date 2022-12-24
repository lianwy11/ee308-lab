import 'package:flutter/material.dart';
import 'package:flutter_refuse_classification/config/color/color_date.dart';
import 'package:flutter_refuse_classification/pages/discover/discover_views/discover_appbar.dart';
import 'package:flutter_refuse_classification/pages/discover/discover_views/first_discover_listview.dart';
import 'package:flutter_refuse_classification/pages/discover/discover_views/second_discover_listview.dart';

class discover_page extends StatefulWidget {
  discover_page({Key? key}) : super(key: key);

  @override
  State<discover_page> createState() => _discover_pageState();
}

class _discover_pageState extends State<discover_page> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: discover_appbar(),
          body: Scaffold(
            appBar: TabBar(
                unselectedLabelColor: Colors.grey,
                labelColor: AppColor.AppColorPrimary,
                tabs: [
                  Tab(
                    text: '精选',
                  ),
                  Tab(
                    text: '视频',
                  ),
                  Tab(
                    text: '同城',
                  ),
                  Tab(
                    text: '政策',
                  ),
                ]),
            body: TabBarView(
              children: [
                first_discover_listview(),
                second_discover_listview(),
                Text('同城'),
                Text('政策')
              ],
            ),
          )),
    );
  }
}
