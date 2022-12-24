import 'package:flutter/material.dart';

class user_name_text_form_field extends TextFormField {
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool isShowClear;
  String? Function(String?)? validator;
  void Function(String?)? onSaved;
  user_name_text_form_field(
      {required this.controller,
      required this.focusNode,
      required this.isShowClear,
      required this.validator,
      required this.onSaved})
      : super(
          controller: controller,
          focusNode: focusNode,
          //设置键盘类型
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: "用户名",
            hintText: "请输入手机号",
            prefixIcon: Icon(Icons.person),
            //尾部添加清除按钮
            suffixIcon: (isShowClear)
                ? IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      // 清空输入框内容
                      controller.clear();
                    },
                  )
                : null,
          ),
          //验证用户名
          validator: validator,
          //保存数据
          onSaved: onSaved,
        );
}
