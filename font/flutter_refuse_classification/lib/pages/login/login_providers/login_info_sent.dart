import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_refuse_classification/config/routers/RouteConfig.dart';
import 'package:flutter_refuse_classification/pages/login/login_models/Login.dart';
import 'package:flutter_refuse_classification/pages/login/login_models/LoginCheck.dart';
import 'package:flutter_refuse_classification/pages/login/login_views/login_toast.dart';
import 'package:get/get.dart';

login_info_sent(String user_phone, String password) async {
  var api = 'http://101.132.45.41:8089/GarbageClassification/UserLogin';
  Login lo_info =
      Login(state: "login", userPhone: user_phone, password: password);
  var response = await Dio().post(api, data: lo_info.toJson());
  print(response);
  var login_response = LoginCheck.fromJson(response.data);

  if (login_response.loginCheck == 'true') {
    Get.offNamed(RouteConfig.main);
  } else {
    login_toast();
  }
}
