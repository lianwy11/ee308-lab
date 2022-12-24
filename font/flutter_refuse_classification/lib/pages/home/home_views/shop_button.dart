import 'package:flutter/material.dart';
import 'package:flutter_refuse_classification/config/color/color_date.dart';
import 'package:flutter_refuse_classification/config/icon/icon_data.dart';
import 'package:get/get.dart';

class shop_button extends StatefulWidget {
  shop_button({Key? key}) : super(key: key);

  @override
  State<shop_button> createState() => _shop_buttonState();
}

class _shop_buttonState extends State<shop_button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Ink(
        height: 1 / 5 * Get.height,
        width: (1 / 2 * Get.width) - 30,
        decoration: BoxDecoration(
          color: AppColor.fifth,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: InkWell(
          onTap: () {},
          borderRadius: new BorderRadius.circular(10.0),
          child: Stack(
            children: [
              Align(
                child: Icon(
                  AppIcon.shop,
                  color: Colors.white,
                  size: 60,
                ),
                alignment: Alignment(0.7, -0.7),
              ),
              Align(
                child: Container(
                  height: 1 / 10 * Get.height,
                  child: Column(
                    children: [
                      Text(
                        '圾分',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'Mytypeface',
                        ),
                      ),
                      Text(
                        '商城',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'Mytypeface',
                        ),
                      )
                    ],
                  ),
                ),
                alignment: Alignment(-0.7, 0.7),
              )
            ],
          ),
        ),
      ),
    );
  }
}
