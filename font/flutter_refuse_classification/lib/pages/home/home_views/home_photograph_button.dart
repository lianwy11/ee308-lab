import 'package:flutter/material.dart';
import 'package:flutter_refuse_classification/config/color/color_date.dart';
import 'package:flutter_refuse_classification/config/icon/icon_data.dart';
import 'package:flutter_refuse_classification/config/routers/RouteConfig.dart';
import 'package:flutter_refuse_classification/pages/search/search_models/search_rubbish.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class home_photograph_button extends StatefulWidget {
  home_photograph_button({Key? key}) : super(key: key);

  @override
  State<home_photograph_button> createState() => _home_photograph_buttonState();
}

class _home_photograph_buttonState extends State<home_photograph_button> {
  //拍照
  void take_photo() async {
    ImagePicker _picker = ImagePicker();
    XFile? image =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);

    //识别
    String path = image!.path;
    var name = path.substring(path.lastIndexOf("/") + 1, path.length);

    print('----------------------------');
    print(path);
    print(name);
    print('----------------------------');

    FormData formdata = FormData.fromMap(
        {"file": MultipartFile.fromFileSync(path, filename: name)});

    Dio dio = Dio();
    var respone = await dio.post(
      "http://101.132.45.41:8089/GarbageClassification/identifyImg",
      data: formdata,
    );
    print('----------------------------000');
    print(respone);
    print('----------------------------000');
    String result = SearchRubbish.fromJson(respone.data).Category;

    switch (result) {
      case "可回收垃圾":
        {
          Get.toNamed(RouteConfig.recycling);
        }
        break;

      case "有害垃圾":
        {
          Get.toNamed(RouteConfig.hazardous_waste);
        }
        break;

      case "有害垃圾":
        {
          Get.toNamed(RouteConfig.hazardous_waste);
        }
        break;

      case "湿垃圾":
        {
          Get.toNamed(RouteConfig.kitchen_waste);
        }
        break;

      default:
        {
          Get.toNamed(RouteConfig.other_rubbish);
        }
        break;
    }
  }

  //拍照按钮
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Ink(
        height: 1 / 10 * Get.height,
        width: Get.width - 20,
        decoration: new BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              AppColor.first_button_start,
              AppColor.first_button_end,
            ],
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),

        //
        child: InkWell(
          borderRadius: new BorderRadius.circular(10.0),
          onTap: () {
            take_photo();
          },
          child: Center(
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: '拍照识分类',
                  style: TextStyle(
                    fontFamily: 'Mytypeface',
                    fontSize: 36,
                  )),
              WidgetSpan(
                  child: Icon(
                AppIcon.camera,
                color: Colors.white,
                size: 36,
              ))
            ])),
          ),
        ),
        //
      ),
    );
  }
}
