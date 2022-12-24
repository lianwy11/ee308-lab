import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'chat_data.dart';

chat_photo_add(XFile? image) {
  var ChatData = Get.put(chat_data());
  ChatData.list_data.add(Image.file(
    File(image!.path),
    width: 1 / 2 * Get.width,
    height: 1 / 4 * Get.height,
  ));
}
