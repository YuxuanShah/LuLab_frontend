import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'sound_manage.dart';
import 'voice_donghua.dart';
import 'xf_manage.dart';

// void main() {
//   runApp(const MaterialApp(
//     home: HomePage(),
//   ));
// }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WsWidgetPage(),
    );
  }
}

const host = 'iat-api.xfyun.cn';
const appId = '552cfd88';
const apiKey = 'ba3a615422f1580076a2bf8eae3debca';
const apiSecret = 'NWZjZDZkOGE4ZmFkOGEyZjkyZjA5MWQz';

class WsWidgetPage extends StatefulWidget {
  const WsWidgetPage({Key? key}) : super(key: key);

  @override
  _WsWidgetPageState createState() => _WsWidgetPageState();
}

class _WsWidgetPageState extends State<WsWidgetPage> {
  String _msg = '等待中...';
  XfManage? _xf;
  bool isListening = true;
  bool visible = true;

  @override
  void initState() {
    super.initState();
    SoundRecord.init();
  }

  @override
  void dispose() {
    _xf?.close();
    SoundRecord.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('讯飞语音转文字测试'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              visible = !visible;
              // MicRecord.startListening();
              // await SoundRecord.startListening();
              if (isListening) {
                await SoundRecord.startListening();
                // setState(() => isListening = false);
                setState(() {
                  _msg = '录音中..';
                  isListening = false;
                });
              } else {
                connect();
              }
              // setState(() {
              //   _msg = '录音中..';
              // });
            },
            child: visible
                ? TestAWidget(
                    visible: visible,
                  )
                : TestBWidget(
                    visible: !visible,
                  ),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(const Color(0xffffffff)),
              shape: MaterialStateProperty.all(const CircleBorder(
                  side: BorderSide(
                //设置 界面效果
                color: Colors.green,
                width: 280.0,
                style: BorderStyle.none,
              ))), //圆角弧度
            ),
          ),
          // ElevatedButton(
          //   onPressed: connect,
          //   child: const Text('停止录音'),
          // ),
          // ElevatedButton(
          //   child: visible
          //       ? TestAWidget(
          //           visible: visible,
          //         )
          //       : TestBWidget(
          //           visible: !visible,
          //         ),
          //   style: ButtonStyle(
          //     backgroundColor: MaterialStateProperty.all(Color(0xffffffff)),
          //     shape: MaterialStateProperty.all(const CircleBorder(
          //         side: BorderSide(
          //       //设置 界面效果
          //       color: Colors.green,
          //       width: 280.0,
          //       style: BorderStyle.none,
          //     ))), //圆角弧度
          //   ),
          //   onPressed: () {
          //     visible = !visible;
          //     // listen();
          //     // setState(() {});
          //     // print(_msg);
          //   },
          // ),
          Container(
            height: 20,
          ),
          Center(child: Text(_msg)),
        ],
      ),
    );
  }

  connect() async {
    // MicRecord.stopListening();
    await SoundRecord.stopListening();
    setState(() {
      _msg = '录音停止,正在语音转文字...';
      isListening = true;
    });

    _xf = XfManage.connect(
      host,
      apiKey,
      apiSecret,
      appId,
      // await MicRecord.currentSamples(),
      await SoundRecord.currentSamples(),
      (msg) {
        setState(() {
          _msg = '语音转文字完成: \r\n$msg';
          if (kDebugMode) {
            print(_msg);
          }
        });
      },
    );
    // print(_msg);
  }

// void listen() async {
//   if (isListening) {
//     SoundRecord.startListening();
//     setState(() => isListening = true);
//   } else {
//     connect();
//   }
// }
}

class TestAWidget extends StatelessWidget {
  final bool visible;

  const TestAWidget({Key? key, required this.visible}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: visible ? 1.0 : 0.0,
      // child: Container(
      //   color: Colors.blue,
      //   height: 100.0,
      //   child: const Center(
      //     child: Text('TestAWidget'),
      //   ),
      // ),
      child: Container(
        height: 50,
        width: 50,
        // margin: EdgeInsets.only(top: 40),
        // padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45),
          color: Colors.blue,
        ),
        child: const Icon(Icons.graphic_eq),
      ),
    );
  }
}

class TestBWidget extends StatelessWidget {
  final bool visible;

  const TestBWidget({Key? key, required this.visible}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: visible ? 1.0 : 0.0,
      // child: Container(
      //   color: Colors.green,
      //   height: 100.0,
      //   child: const Center(
      //     child: Text('TestBWidget'),
      //   ),
      // ),
      child: const SizedBox(height: 50, width: 50, child: WaterRipple()),
    );
  }
}
