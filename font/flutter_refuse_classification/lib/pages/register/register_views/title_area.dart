import 'package:flutter/material.dart';

class title_area extends ListTile {
  title_area()
      : super(
          title: Text(
            "欢迎注册",
            style: TextStyle(color: Colors.black54, fontSize: 28),
            textAlign: TextAlign.center,
          ),
          subtitle: TextButton(
            onPressed: () {},
            child: Text(
              "若您已有账号，请点此登录>",
              style: TextStyle(color: Colors.black45, fontSize: 17),
              textAlign: TextAlign.center,
            ),
          ),
        );
}
