import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';

import 'package:path_provider/path_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';

const int tSampleRate = 16000;

class record_sound_page extends StatefulWidget {
  record_sound_page({Key? key}) : super(key: key);

  @override
  State<record_sound_page> createState() => _record_sound_pageState();
}

class _record_sound_pageState extends State<record_sound_page> {
  String? _mPath;
  FlutterSoundPlayer? _mPlayer = FlutterSoundPlayer();
  FlutterSoundRecorder? _mRecorder = FlutterSoundRecorder();
  StreamSubscription? _mRecordingDataSubscription;

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

  Future<IOSink> createFile() async {
    var tempDir = await getTemporaryDirectory();
    _mPath = '${tempDir.path}/flutter_sound_example.pcm';
    var outputFile = File(_mPath!);
    if (outputFile.existsSync()) {
      await outputFile.delete();
    }
    return outputFile.openWrite();
  }

  _start_record() async {
    // assert(_mPlayer!.isStopped);
    var sink = await createFile();
    var recordingDataController = StreamController<Food>();
    _mRecordingDataSubscription =
        recordingDataController.stream.listen((buffer) {
      if (buffer is FoodData) {
        sink.add(buffer.data!);
      }
    });

    //
    _mRecorder!
        .startRecorder(
      toStream: recordingDataController.sink,
      codec: Codec.pcm16,
      sampleRate: tSampleRate,
      numChannels: 1,
    )
        .then((value) {
      setState(() {});
    });
  }

  _stop_record() async {
    await _mRecorder!.stopRecorder();
    if (_mRecordingDataSubscription != null) {
      await _mRecordingDataSubscription!.cancel();
      _mRecordingDataSubscription = null;
    }
  }

  _play_record() async {
    print('----------------------播放----------------------');
    _mPlayer!.startPlayer(
        fromURI: _mPath,
        codec: Codec.pcm16,
        sampleRate: tSampleRate,
        numChannels: 1,
        //codec: kIsWeb ? Codec.opusWebM : Codec.aacADTS,
        whenFinished: () {
          _mPlayer!.stopPlayer();
          setState(() {});
        });
  }

  _post_pcm() async {
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
    print(respone);
    print('----------------------------000');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              height: 300,
            ),
            GestureDetector(
              onTapDown: (e) {
                print('点击按下');
                _start_record();
              },
              onTapUp: (e) {
                print('点击抬起');
                _stop_record();
              },
              child: Container(
                color: Colors.blue,
                height: 50,
                width: 50,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  _play_record();
                  _post_pcm();
                },
                child: Text('播放'))
          ],
        ),
      ),
    );
  }
}
