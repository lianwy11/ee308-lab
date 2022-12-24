import 'package:flutter/material.dart';

class chat_appbar extends AppBar {
  final String target;

  chat_appbar({required this.target})
      : super(
          centerTitle: true,
          title: Text(
            target,
            style: TextStyle(color: Colors.white),
          ),
        );
}
