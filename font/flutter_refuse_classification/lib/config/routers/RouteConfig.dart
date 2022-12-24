import 'package:flutter_refuse_classification/pages/chat/chat_pages/chat_page.dart';
import 'package:flutter_refuse_classification/pages/home/home_pages/The_answer_match.dart';
import 'package:flutter_refuse_classification/pages/location/location_pages/location_page.dart';
import 'package:flutter_refuse_classification/pages/location/location_pages/location_page_demo.dart';
import 'package:flutter_refuse_classification/pages/login/login_pages/login_page.dart';
import 'package:flutter_refuse_classification/pages/main/main_pages/main_page.dart';
import 'package:flutter_refuse_classification/pages/personal_center/personal_center_page/personal_center_page.dart';
import 'package:flutter_refuse_classification/pages/record_sound/page/record_sound_page.dart';
import 'package:flutter_refuse_classification/pages/register/register_pages/register_page.dart';
import 'package:flutter_refuse_classification/pages/search/search_pages/hazardous_waste.dart';
import 'package:flutter_refuse_classification/pages/search/search_pages/kitchen_waste.dart';
import 'package:flutter_refuse_classification/pages/search/search_pages/other_rubbish.dart';
import 'package:flutter_refuse_classification/pages/search/search_pages/recycling.dart';
import 'package:get/get.dart';

class RouteConfig {
  ///主页面
  static const String main = "/";
  static const String login = "/login";
  static const String register = "/register";
  static const String location = "/location";
  static const String location_demo = "/location_demo";
  static const String chat = "/chat";
  static const String record_sound = "/record_sound";
  static const String personal_center = "/personal_center";
  //垃圾详情介绍
  static const String recycling = "/search_recycling";
  static const String other_rubbish = "/search_other_rubbish";
  static const String kitchen_waste = "/search_kitchen_waste";
  static const String hazardous_waste = "/search_hazardous_waste";
  //积分竞答
  static const String match = "/match_page";

  static final List<GetPage> getPages = [
    GetPage(name: main, page: () => main_page()),
    GetPage(name: login, page: () => login_page()),
    GetPage(name: register, page: () => register_page()),
    GetPage(name: location, page: () => location_page()),
    GetPage(name: location_demo, page: () => location_demo_page()),
    GetPage(name: chat, page: () => chat_page(target: "智能助手")),
    GetPage(name: record_sound, page: () => record_sound_page()),
    GetPage(name: personal_center, page: () => personal_center_page()),

    //垃圾详情介绍
    GetPage(name: hazardous_waste, page: () => hazardous_waste_page()),
    GetPage(name: recycling, page: () => recycling_page()),
    GetPage(name: other_rubbish, page: () => other_rubbish_page()),
    GetPage(name: kitchen_waste, page: () => kitchen_waste_page()),
    //积分竞答
    GetPage(name: match, page: () => match_page()),
  ];
}
