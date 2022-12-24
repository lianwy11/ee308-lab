import 'package:flutter/material.dart';

class first_icon_button extends StatelessWidget {
  final VoidCallback? onPressed;
  final int index;
  first_icon_button({required this.onPressed, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class second_icon_button extends IconButton {
  final VoidCallback? onPressed;
  final int index;
  second_icon_button({required this.onPressed, required this.index})
      : super(
            icon: Icon(IconData(0xf02a4, fontFamily: 'MyIcons')),
            color: Colors.white,
            onPressed: onPressed);
}
