import 'package:flutter/material.dart';
import 'package:flutter_refuse_classification/config/color/color_date.dart';

class search_appbar extends AppBar {
  search_appbar()
      : super(
          title: Text(
            "分类速查",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                ))
          ],
          //
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColor.Appbar_Start, AppColor.Appbar_end],
              ),
            ),
          ),
        );
}
