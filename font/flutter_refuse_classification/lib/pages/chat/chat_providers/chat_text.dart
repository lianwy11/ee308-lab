import 'package:dio/dio.dart';
import 'package:flutter_refuse_classification/pages/chat/chat_models.dart/chat_refuse_classification.dart';

class chat_text {
  String receive;
  chat_text({required this.receive}) {
    if (receive.length >= 7) {
      if (receive.substring(receive.length - 6, receive.length) == '是什么垃圾？') {
        print(receive.substring(0, receive.length - 6));
        _get_refuse_classification_from_text(
            receive.substring(0, receive.length - 6));
      }
    }
  }

  _get_refuse_classification_from_text(String refuse) async {
    var respone = await Dio().get(
        "http://101.132.45.41:8089/GarbageClassification/identifyText?GarbageName=${refuse}");
    print('--------------------------------');
    print(respone);
    print('--------------------------------');

    RefuseClassification.fromJson(respone.data);
  }
}
