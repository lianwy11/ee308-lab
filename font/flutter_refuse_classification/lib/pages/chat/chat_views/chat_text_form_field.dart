import 'package:flutter/material.dart';

class chat_text_form_field extends TextField {
  final FocusNode? focusNode;
  final TextEditingController? controller;
  chat_text_form_field({required this.focusNode, required this.controller})
      : super(
          focusNode: focusNode,
          controller: controller,
          style: TextStyle(
            height: 1,
            fontSize: 18,
          ),
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            fillColor: Colors.grey,
            filled: true,
            enabledBorder: OutlineInputBorder(
              /*边角*/

              borderRadius: BorderRadius.all(
                Radius.circular(30), //边角为5
              ),
              borderSide: BorderSide(
                color: Colors.transparent, //边线颜色为白色
                width: 2, //边线宽度为2
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.lightGreen, //边框颜色为白色
                width: 2, //宽度为5
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(30), //边角为30
              ),
            ),
          ),
        );
}
