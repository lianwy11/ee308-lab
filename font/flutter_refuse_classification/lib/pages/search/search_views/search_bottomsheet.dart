import 'package:flutter/material.dart';

Future openSearchBottomSheet(BuildContext context) async {
  ScrollController _controller = ScrollController();
  final option = await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300.0,
          child: Column(
            children: <Widget>[
              Text("请选择城市"),
              ListView.builder(
                controller: _controller,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(info[index], textAlign: TextAlign.center),
                    onTap: () {
                      Navigator.pop(context, info[index]);
                    },
                  );
                },
                itemCount: info.length,
              )
            ],
          ),
        );
      });

  print(option);
}

List<String> info = [
  '国标',
  '北京市',
  '上海市',
  '重庆市',
  '石家庄市',
  '太原市',
];
