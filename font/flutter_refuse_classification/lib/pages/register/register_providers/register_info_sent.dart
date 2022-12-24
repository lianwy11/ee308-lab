import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_refuse_classification/config/routers/RouteConfig.dart';
import 'package:flutter_refuse_classification/pages/register/register_models/Register.dart';
import 'package:flutter_refuse_classification/pages/register/register_models/RegisterCheck.dart';
import 'package:flutter_refuse_classification/pages/register/register_views/register_toast.dart';
import 'package:get/get.dart';

register_info_sent(String name, String user_phone, String password) async {
  var api = 'http://101.132.45.41:8089/GarbageClassification/UserRegister';
  Register re_info = Register(
      state: "register",
      name: name,
      user_phone: user_phone,
      password: password);
  var response = await Dio().post(api, data: re_info.toJson());
  print('-------------------------------');
  print(response);
  var register_response = RegisterCheck.fromJson(response.data);
  if (register_response.registerCheck == 'true') {
    print('---true---');
    Get.offNamed(RouteConfig.main);
  } else {
    print('---false---');
    register_toast();
  }
}
