import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

login_toast() {
  Fluttertoast.showToast(
      msg: "此号码或密码错误，请重新输入信息",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}
