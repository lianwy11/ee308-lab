import 'package:flutter/material.dart';
import 'package:flutter_refuse_classification/config/color/color_date.dart';

class community_subtitle extends Row {
  community_subtitle()
      : super(children: [
          SizedBox(
            height: 25,
            width: 2,
            child: Container(
              color: Colors.black,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
            child: Text(
              "二手交易",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          )
        ]);
}
