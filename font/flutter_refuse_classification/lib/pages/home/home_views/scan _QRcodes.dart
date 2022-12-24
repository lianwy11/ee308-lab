import 'package:flutter/material.dart';
import 'package:flutter_refuse_classification/config/color/color_date.dart';
import 'package:flutter_refuse_classification/config/icon/icon_data.dart';
import 'package:get/get.dart';

class scan_QRcodes extends StatefulWidget {
  scan_QRcodes({Key? key}) : super(key: key);

  @override
  State<scan_QRcodes> createState() => _scan_QRcodesState();
}

class _scan_QRcodesState extends State<scan_QRcodes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Ink(
        height: 1 / 10 * Get.height,
        width: (1 / 2 * Get.width) - 30,
        decoration: BoxDecoration(
          color: AppColor.third,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: InkWell(
          onTap: () {},
          child: Stack(
            children: [
              Align(
                child: Icon(
                  AppIcon.scan,
                  color: Colors.white,
                  size: 54,
                ),
                alignment: Alignment(0.7, 0),
              ),
              Align(
                child: Container(
                  width: 60,
                  height: 60,
                  child: Column(
                    children: [
                      Text(
                        "扫码",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'Mytypeface',
                        ),
                      ),
                      Text(
                        "投放",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'Mytypeface',
                        ),
                      ),
                    ],
                  ),
                ),
                alignment: Alignment(-0.7, 0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
