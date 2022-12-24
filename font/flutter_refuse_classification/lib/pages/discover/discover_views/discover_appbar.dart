import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_refuse_classification/config/color/color_date.dart';
import 'package:flutter_refuse_classification/config/icon/icon_data.dart';

class discover_appbar extends AppBar {
  discover_appbar()
      : super(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColor.Appbar_Start, AppColor.Appbar_end],
              ),
            ),
          ),
          //
          leading: Center(
            child: Text(
              "Hi~",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: "App",
                  fontWeight: FontWeight.w100,
                  color: Colors.white),
            ),
          ),
          actions: [
            Row(
              children: [
                Icon(
                  AppIcon.leaf,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  "圾分值",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: "App",
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "628",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: "App",
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: SizedBox(
                    width: 2,
                    child: Container(color: Colors.white),
                  ),
                ),
                Icon(
                  AppIcon.conversation,
                  size: 20,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            )
          ],
          //
        );
}
