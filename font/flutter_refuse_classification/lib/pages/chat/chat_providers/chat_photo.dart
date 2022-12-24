import 'package:flutter_refuse_classification/pages/chat/chat_models.dart/chat_refuse_classification.dart';
import 'package:flutter_refuse_classification/pages/chat/chat_providers/photo_add.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

class chat_photo {
  final XFile? image;
  chat_photo({required this.image});
  add_photo() async {
    //把照片加入到聊天框中
    chat_photo_add(image);

    //识别
    String path = image!.path;
    var name = path.substring(path.lastIndexOf("/") + 1, path.length);

    print('----------------------------');
    print(path);
    print(name);
    print('----------------------------');

    FormData formdata = FormData.fromMap(
        {"file": MultipartFile.fromFileSync(path, filename: name)});

    Dio dio = Dio();
    var respone = await dio.post(
      "http://101.132.45.41:8089/GarbageClassification/identifyImg",
      data: formdata,
    );
    print('----------------------------000');
    print(respone);
    print('----------------------------000');

    RefuseClassification.fromJson(respone.data);
  }
}
