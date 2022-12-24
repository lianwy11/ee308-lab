import 'package:flutter/material.dart';
import 'package:flutter_refuse_classification/config/color/color_date.dart';
import 'package:flutter_refuse_classification/config/icon/icon_data.dart';
import 'package:get/get.dart';

class record_button extends StatefulWidget {
  record_button({Key? key}) : super(key: key);

  @override
  State<record_button> createState() => _record_buttonState();
}

class _record_buttonState extends State<record_button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Ink(
        height: 1 / 10 * Get.height,
        width: (1 / 2 * Get.width) - 30,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              AppColor.fourth_s,
              AppColor.fourth_e,
            ],
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: InkWell(
          onTap: () {},
          child: Stack(
            children: [
              Align(
                child: Icon(
                  AppIcon.record,
                  color: Colors.white,
                  size: 54,
                ),
                alignment: Alignment(-0.7, 0),
              ),
              Align(
                child: Container(
                  width: 60,
                  height: 60,
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
                        "记录",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'Mytypeface',
                        ),
                      ),
                    ],
                  ),
                ),
                alignment: Alignment(0.7, 0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
