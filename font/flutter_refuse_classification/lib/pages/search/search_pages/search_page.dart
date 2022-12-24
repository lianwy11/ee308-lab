import 'package:flutter/material.dart';
import 'package:flutter_refuse_classification/pages/search/search_provides/search_loction.dart';
import 'package:flutter_refuse_classification/pages/search/search_views/search_appbar.dart';
import 'package:flutter_refuse_classification/pages/search/search_views/search_background.dart';
import 'package:flutter_refuse_classification/pages/search/search_views/search_bar.dart';
import 'package:flutter_refuse_classification/pages/search/search_views/search_select.dart';
import 'package:get/get.dart';

class search_page extends StatefulWidget {
  search_page({Key? key}) : super(key: key);

  @override
  State<search_page> createState() => _search_pageState();
}

class _search_pageState extends State<search_page> {
  //页面
  @override
  Widget build(BuildContext context) {
    //
    final search_loction loc = Get.put(search_loction());
    TextEditingController _controller = TextEditingController();
    FocusNode _focusNode = FocusNode();

    //

    return Scaffold(
        appBar: search_appbar(),
        body: GestureDetector(
          onTap: () {
            _focusNode.unfocus();
          },
          child: Container(
            child: Stack(
              children: [
                //背景图片
                Align(
                  alignment: Alignment(0, -0.75),
                  child: search_background(),
                ),
                //搜索栏
                Align(
                  alignment: Alignment(0, -0.93),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Obx(() => search_bar(
                          loction: loc.loction.value,
                          controller: _controller,
                          focusNode: _focusNode,
                        )),
                  ),
                ),
                //垃圾种类
                Align(
                  alignment: Alignment(0, 0.9),
                  child: search_select(),
                )
              ],
            ),
          ),
        ));
  }
}
