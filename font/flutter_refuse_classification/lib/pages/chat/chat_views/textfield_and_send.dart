import 'package:flutter/material.dart';
import 'package:flutter_refuse_classification/pages/chat/chat_views/chat_text_form_field.dart';

class textfield_and_send extends Padding {
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final VoidCallback? onPressed;
  textfield_and_send(
      {required this.focusNode,
      required this.controller,
      required this.onPressed})
      : super(
            padding: EdgeInsets.all(5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: chat_text_form_field(
                    focusNode: focusNode,
                    controller: controller,
                  ),
                ),
                IconButton(onPressed: onPressed, icon: Icon(Icons.send))
              ],
            ));
}
