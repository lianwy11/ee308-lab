import 'package:flutter/material.dart';
import 'package:get/get.dart';

class community_first_part extends Container {
  static String url =
      "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fe0.ifengimg.com%2F11%2F2019%2F0422%2F0DCA548622D5AB435DAA8CBC9F2ED63CE2C7E52B_size493_w1920_h1080.jpeg&refer=http%3A%2F%2Fe0.ifengimg.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1646716380&t=dc46a8bca46c2465c0761703a412193c";

  community_first_part()
      : super(
          child: Column(
            children: [
              //1
              Container(
                width: 5 / 6 * Get.width,
                height: 1 / 6 * Get.height + 11,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(url), fit: BoxFit.fitWidth),
                    borderRadius: new BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
              ),
              ListTile(
                leading: Column(
                  children: [
                    Text(
                      "28",
                      style: TextStyle(fontSize: 32),
                    ),
                    Text("六月")
                  ],
                ),
                title: Text(
                  "守护美丽中国  我们是行动者  守护美丽中国  我们是行动者",
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text("地点：小帮社区中心 \n报名截止：6月28"),
              ),
              SizedBox(
                height: 1,
                width: 4 / 6 * Get.width,
                child: Container(
                  color: Colors.grey[200],
                ),
              ),
              ListTile(
                title: Text("已有34人参与"),
                trailing: TextButton(onPressed: () {}, child: Text("去参与")),
              )
            ],
          ),
          //边框
          height: 1 / 3 * Get.height,
          decoration: BoxDecoration(
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
