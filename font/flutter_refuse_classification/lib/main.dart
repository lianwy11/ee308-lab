import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_refuse_classification/config/color/color_date.dart';
import 'package:get/get.dart';

import 'config/routers/RouteConfig.dart';

void main() {
  if (GetPlatform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      color: AppColor.AppColorPrimary,
      debugShowCheckedModeBanner: false,
      getPages: RouteConfig.getPages,
      initialRoute: RouteConfig.main,
    );
  }
}
