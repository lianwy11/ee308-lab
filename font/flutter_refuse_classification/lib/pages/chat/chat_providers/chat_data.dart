import 'package:flutter/material.dart';
import 'package:flutter_refuse_classification/config/icon/icon_data.dart';
import 'package:flutter_refuse_classification/pages/chat/chat_providers/chat_photo.dart';
import 'package:flutter_refuse_classification/pages/chat/chat_providers/chat_text.dart';
import 'package:flutter_refuse_classification/pages/chat/chat_providers/chat_voice.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class chat_data extends GetxController {
  var list_data = [].obs;
  //文字
  void text_add(String refuse) {
    list_data.add(Text(refuse));
    chat_text(receive: refuse);
  }

  //图片
  void photo_add() async {
    ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    chat_photo(image: image).add_photo();
  }

  //照相
  void camera_add() async {
    ImagePicker _picker = ImagePicker();
    XFile? image =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    chat_photo(image: image).add_photo();
  }

  //音频q
  void voice_add(chat_voice voice) async {
    list_data.add(IconButton(
        onPressed: () {
          voice.play_record();
        },
        icon: Icon(AppIcon.aodio)));
    Future.delayed(Duration(milliseconds: 1000), () {
      voice.post_pcm();
    });
  }
}
