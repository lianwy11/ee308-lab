import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_refuse_classification/config/icon/icon_data.dart';
import 'package:flutter_refuse_classification/pages/chat/chat_providers/chat_data.dart';
import 'package:flutter_refuse_classification/pages/chat/chat_providers/chat_voice.dart';
import 'package:flutter_refuse_classification/pages/chat/chat_views/chat_appbar.dart';
import 'package:flutter_refuse_classification/pages/chat/chat_views/received_message_screen.dart';
import 'package:flutter_refuse_classification/pages/chat/chat_views/send_messsage_screen.dart';
import 'package:flutter_refuse_classification/pages/chat/chat_views/textfield_and_send.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:get/get.dart';

const int tSampleRate = 16000;

class chat_page extends StatefulWidget {
  final String target;
  chat_page({Key? key, required this.target}) : super(key: key);

  @override
  State<chat_page> createState() => _chat_pageState();
}

class _chat_pageState extends State<chat_page> {
  final ChatData = Get.put(chat_data());

  //
  int index = 0;
  FlutterSoundPlayer? _mPlayer = FlutterSoundPlayer();
  FlutterSoundRecorder? _mRecorder = FlutterSoundRecorder();

  //
  ScrollController _scrollController = ScrollController();
  TextEditingController _controller = TextEditingController();

  //
  late chat_voice voice;

  jump() {
    Timer(
        Duration(milliseconds: 500),
        () => _scrollController
            .jumpTo(_scrollController.position.maxScrollExtent));
  }

  @override
  void initState() {
    super.initState();
    _mPlayer!.openPlayer();
    _mRecorder!.openRecorder();
  }

  @override
  void dispose() {
    _mPlayer!.closePlayer();
    _mPlayer = null;

    _mRecorder!.closeRecorder();
    _mRecorder = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FocusNode _focusNode = FocusNode();

    return GestureDetector(
        onTap: () => _focusNode.unfocus(),
        child: Scaffold(
          appBar: chat_appbar(target: widget.target),
          body: Column(
            children: [
              Expanded(
                child: Obx(() => ListView.builder(
                    controller: _scrollController,
                    shrinkWrap: true,
                    itemCount: ChatData.list_data.length,
                    padding: EdgeInsets.only(top: 27),
                    itemBuilder: (context, index) {
                      return index % 2 == 0
                          ? send(child: ChatData.list_data[index])
                          : received(child: ChatData.list_data[index]);
                    })),
              ),
              //输入框
              Container(
                  height: 110,
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(color: Colors.grey[200] as Color))),
                  child: Column(
                    children: [
                      textfield_and_send(
                          focusNode: _focusNode,
                          controller: _controller,
                          onPressed: () {
                            ChatData.text_add(_controller.text);
                            _controller.text = '';
                          }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            child: Icon(AppIcon.voice),
                            onTapDown: (e) {
                              print('点击按下');
                              voice = new chat_voice(
                                  index: index,
                                  mPlayer: _mPlayer,
                                  mRecorder: _mRecorder);
                              voice.start_record();
                            },
                            onTapUp: (e) {
                              print('点击抬起');
                              voice.stop_record();
                              index++;
                              ChatData.voice_add(voice);
                              jump();
                            },
                          ),
                          IconButton(
                              onPressed: () {
                                ChatData.camera_add();
                              },
                              icon: Icon(AppIcon.camera)),
                          GestureDetector(
                            child: Icon(AppIcon.photo),
                            onTap: () {
                              ChatData.photo_add();
                            },
                          )
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ));
  }
}
