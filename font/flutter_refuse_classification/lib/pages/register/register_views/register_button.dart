import 'package:flutter/material.dart';

class register_button extends ElevatedButton {
  register_button({required void Function()? onPressed})
      : super(
          onPressed: onPressed,
          child: Text(
            "完成注册",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          style: ButtonStyle(
            shape: MaterialStateProperty.all(StadiumBorder(
                side: BorderSide(
                    //设置 界面效果
                    style: BorderStyle.solid,
                    color: Colors.transparent))),
          ),
        );
}
