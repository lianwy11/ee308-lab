import 'package:get/get.dart';

class search_loction extends GetxController {
  var loction = RxString('国标');
  //var num = RxInt(0), 此语法也可以，也是具有响应式的
  void change(String s) {
    this.loction.value = s;
  }
}
