import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

register_toast() {
  Fluttertoast.showToast(
      msg: "此号码或姓名已经注册，请重新输入信息",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}
