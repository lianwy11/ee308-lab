import 'package:flutter/material.dart';

//忘记密码  立即注册
class bottom_area extends Container {
  final VoidCallback? onPressed;

  bottom_area({required this.onPressed})
      : super(
          margin: EdgeInsets.only(right: 20, left: 30),
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TextButton(
                child: Text(
                  "忘记密码?",
                  style: TextStyle(
                    color: Colors.blue[400],
                    fontSize: 16.0,
                  ),
                ),
                //忘记密码按钮，点击执行事件
                onPressed: () {},
              ),
              TextButton(
                child: Text(
                  "快速注册",
                  style: TextStyle(
                    color: Colors.blue[400],
                    fontSize: 16.0,
                  ),
                ),
                //点击快速注册、执行事件
                onPressed: onPressed,
              ),
            ],
          ),
        );
}
