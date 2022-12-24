// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class login_button extends RaisedButton {
  final VoidCallback? onPressed;

  login_button({required this.onPressed})
      : super(
            color: Colors.lightBlue,
            child: Text(
              "登录",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            // 设置按钮圆角
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
            onPressed: onPressed);
}

class login_button_area extends Container {
  final VoidCallback? onPressed;

  login_button_area({required this.onPressed})
      : super(
            margin: EdgeInsets.only(left: 20, right: 20),
            height: 45.0,
            child: login_button(
              onPressed: onPressed,
            ));
}
