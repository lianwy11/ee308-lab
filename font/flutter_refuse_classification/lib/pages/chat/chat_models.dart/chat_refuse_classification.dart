import 'package:flutter/cupertino.dart';
import 'package:flutter_refuse_classification/pages/chat/chat_providers/chat_data.dart';
import 'package:get/get.dart';

class RefuseClassification {
  RefuseClassification({
    required this.Rubbish,
    required this.Category,
  });
  late final String Rubbish;
  late final String Category;

  RefuseClassification.fromJson(Map<String, dynamic> json) {
    Rubbish = json['Rubbish'];
    Category = json['Category'];
    var ChatData = Get.put(chat_data());
    ChatData.list_data.add(Text(Category));
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Rubbish'] = Rubbish;
    _data['Category'] = Category;
    return _data;
  }
}
