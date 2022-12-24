import 'package:flutter/material.dart';

class register_text_form_field extends TextFormField {
  //属性
  final FocusNode? focusNode;
  final String register_info;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;

  //构造
  register_text_form_field(
      {required FocusNode? this.focusNode,
      required String this.register_info,
      required void Function(String?)? this.onSaved,
      required String? Function(String?)? this.validator})
      : super(
            focusNode: focusNode,
            style: TextStyle(
              height: 1,
              fontSize: 16,
            ),
            onSaved: onSaved,
            validator: validator,
            decoration: InputDecoration(
              fillColor: Colors.grey[200],
              filled: true,
              hintStyle: TextStyle(color: Colors.grey[400]),
              hintText: " 请输入" + register_info,
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
                  color: Colors.blue, //边框颜色为白色
                  width: 2, //宽度为5
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(30), //边角为30
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red, //边框颜色为白色
                  width: 2, //宽度为5
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(30), //边角为30
                ),
              ),
            ));
}
