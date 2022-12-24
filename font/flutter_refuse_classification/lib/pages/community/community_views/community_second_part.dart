import 'package:flutter/material.dart';
import 'package:flutter_refuse_classification/config/icon/icon_data.dart';
import 'package:get/get.dart';

class community_second_part extends Container {
  community_second_part()
      : super(
          height: 1 / 7 * Get.height - 10,

          //
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/community_second_part.png'),
                fit: BoxFit.contain),
            boxShadow: [
              BoxShadow(
                  blurRadius: 2,
                  color: Colors.grey[400] as Color,
                  offset: Offset(0, 1))
            ],
            color: Colors.white,
            borderRadius: new BorderRadius.circular((10.0)),
          ),
        );
}
