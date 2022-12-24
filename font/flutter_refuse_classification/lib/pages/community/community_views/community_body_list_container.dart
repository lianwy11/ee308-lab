import 'package:flutter/material.dart';
import 'package:get/get.dart';

class community_body_list_container extends Padding {
  List<Widget> children;
  community_body_list_container({required this.children})
      : super(
          padding:
              EdgeInsets.fromLTRB(1 / 12 * Get.width, 0, 1 / 12 * Get.width, 0),
          child: ListView(
            children: children,
          ),
        );
}
