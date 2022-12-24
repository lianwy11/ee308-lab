import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_refuse_classification/pages/chat/chat_models.dart/chat_refuse_classification.dart';
import 'package:flutter_refuse_classification/pages/chat/chat_providers/chat_data.dart';

import 'package:path_provider/path_provider.dart';

import 'package:flutter_sound/flutter_sound.dart';

//采样频率
const int tSampleRate = 16000;

class chat_voice {
  String? _mPath;
  FlutterSoundPlayer? mPlayer;
  FlutterSoundRecorder? mRecorder;
  StreamSubscription? _mRecordingDataSubscription;
  final int index;

  chat_voice(
      {required this.index, required this.mPlayer, required this.mRecorder});

  //创造路径
  Future<IOSink> createFile() async {
    var tempDir = await getTemporaryDirectory();
    _mPath = '${tempDir.path}/flutter_sound_example${index}.pcm';
    var outputFile = File(_mPath!);
    if (outputFile.existsSync()) {
      await outputFile.delete();
    }
    return outputFile.openWrite();
  }

  //开始录音
  start_record() async {
    //
    var sink = await createFile();
    var recordingDataController = StreamController<Food>();
    _mRecordingDataSubscription =
        recordingDataController.stream.listen((buffer) {
      if (buffer is FoodData) {
        sink.add(buffer.data!);
      }
    });

    //
    mRecorder!.startRecorder(
      toStream: recordingDataController.sink,
      codec: Codec.pcm16,
      sampleRate: tSampleRate,
      numChannels: 1,
    );
  }

  //停止录音
  stop_record() async {
    await mRecorder!.stopRecorder();
    if (_mRecordingDataSubscription != null) {
      await _mRecordingDataSubscription!.cancel();
      _mRecordingDataSubscription = null;
    }
  }

  //播放录音
  play_record() async {
    print('----------------------播放----------------------');
    mPlayer!.startPlayer(
        fromURI: _mPath,
        codec: Codec.pcm16,
        sampleRate: tSampleRate,
        numChannels: 1,
        //codec: kIsWeb ? Codec.opusWebM : Codec.aacADTS,

        //关闭播放器
        whenFinished: () {});
  }

  //发送录音,获取信息
  post_pcm() async {
    FormData formdata = FormData.fromMap({
      "file": MultipartFile.fromFileSync(_mPath!,
          filename: 'flutter_sound_example.pcm')
    });

    Dio dio = Dio();
    var respone = await dio.post(
      "http://101.132.45.41:8089/GarbageClassification/identifyVoice",
      data: formdata,
      // options: Options(contentType: ),
    );
    print('----------------------------000');
    print('----------------------------000');
    print(respone);
    print('----------------------------000');
    print('----------------------------000');

    RefuseClassification.fromJson(respone.data);
  }
}
