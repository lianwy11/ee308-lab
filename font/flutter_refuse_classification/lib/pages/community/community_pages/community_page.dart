import 'package:flutter/material.dart';
import 'package:flutter_refuse_classification/pages/community/community_views/community_appbar.dart';
import 'package:flutter_refuse_classification/pages/community/community_views/community_body_list_container.dart';
import 'package:flutter_refuse_classification/pages/community/community_views/community_first_part.dart';
import 'package:flutter_refuse_classification/pages/community/community_views/community_second_part.dart';
import 'package:flutter_refuse_classification/pages/community/community_views/community_subtitle.dart';
import 'package:flutter_refuse_classification/pages/community/community_views/community_third_part.dart';

class community_page extends StatefulWidget {
  community_page({Key? key}) : super(key: key);

  @override
  State<community_page> createState() => _community_pageState();
}

class _community_pageState extends State<community_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: community_appbar(),
        body: community_body_list_container(
          children: [
            SizedBox(height: 20),
            community_first_part(),
            SizedBox(height: 20),
            community_second_part(),
            SizedBox(height: 20),
            community_subtitle(),
            SizedBox(height: 20),
            community_third_part()
          ],
        ));
  }
}
