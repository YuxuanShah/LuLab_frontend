import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
// import 'dart:async';
import 'package:text_to_speech/text_to_speech.dart';

import 'VoiceAI/sound_manage.dart';
import 'VoiceAI/voice_donghua.dart';
import 'VoiceAI/xf_manage.dart';
// import '../course/course_page.dart';
import 'pages/course/course_page.dart';
import 'pages/home/homepage.dart';
// import 'pages/source/Informationpage.dart';
import 'pages/source/Information_page.dart';
import 'pages/users/users_page.dart';
import 'values/myIcon.dart';
// import '/users/userspage.dart';

const host = 'iat-api.xfyun.cn';
const appId = '552cfd88';
const apiKey = 'ba3a615422f1580076a2bf8eae3debca';
const apiSecret = 'NWZjZDZkOGE4ZmFkOGEyZjkyZjA5MWQz';

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  String msg = '等待中...';
  XfManage? _xf;
  bool isListening = true;
  bool visible = true;
  bool show = true;
  int _currentIndex = 0;
  final String defaultLanguage = 'zh-CN';
  TextToSpeech tts = TextToSpeech();
  double volume = 1; // Range: 0-1
  double rate = 1.0; // Range: 0-2
  double pitch = 1.0; // Range: 0-2

  String? language;
  String? languageCode;
  List<String> languages = <String>[];
  List<String> languageCodes = <String>[];
  String? voice;

  TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    SoundRecord.init();
    textEditingController.text = text;
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      initLanguages();
    });
  }
  // @override
  // void initState() {
  //   super.initState();
  //   SoundRecord.init();
  // }

  Future<void> initLanguages() async {
    /// populate lang code (i.e. en-US)
    languageCodes = await tts.getLanguages();

    /// populate displayed language (i.e. English)
    final List<String>? displayLanguages = await tts.getDisplayLanguages();
    if (displayLanguages == null) {
      return;
    }

    languages.clear();
    for (final dynamic lang in displayLanguages) {
      languages.add(lang as String);
    }

    final String? defaultLangCode = await tts.getDefaultLanguage();
    if (defaultLangCode != null && languageCodes.contains(defaultLangCode)) {
      languageCode = defaultLangCode;
    } else {
      languageCode = defaultLanguage;
    }
    language = await tts.getDisplayLanguageByCode(languageCode!);

    /// get voice
    voice = await getVoiceByLang(languageCode!);

    if (mounted) {
      setState(() {});
    }
  }

  Future<String?> getVoiceByLang(String lang) async {
    final List<String>? voices = await tts.getVoiceByLang(languageCode!);
    if (voices != null && voices.isNotEmpty) {
      return voices.first;
    }
    return null;
  }

  List _pageList = [
    HomePage(),
    CoursePage(),
    // VoicePage(),
    InformationPage(),
    UsersPage(),
  ];
  late stt.SpeechToText speech;
  String text = '对不起现在我还没有接收到后端的数据';
  double conf = 1.0;
  // @override
  // void initState() {
  //   super.initState();
  //   speech = stt.SpeechToText();
  // }

  @override
  void dispose() {
    _xf?.close();
    SoundRecord.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance?.addPostFrameCallback((_) {
    //   Overlay.of(context)?.insert(_entry());
    // });
    return Scaffold(
        // 语音识别按钮

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
        //     setState(() {});
        //   },
        // ),
        floatingActionButton:
            // AvatarGlow(
            // animate: isListening,
            // glowColor: Theme.of(context).primaryColor,
            // endRadius: 75.0,
            // duration: const Duration(milliseconds: 2000),
            // repeatPauseDuration: const Duration(milliseconds: 100),
            // repeat: true,
            // child:
            Stack(
          children: <Widget>[
            new Positioned(
              //其他的组件加上去以这种形式
              bottom: 10.0,
              left: 143.0,
              child: Container(
                height: 80.0,
                width: 80.0,
                margin: EdgeInsets.only(top: 30),
                // padding: EdgeInsets.all(10),
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(45),
                //   color: Color.fromRGBO(250, 250, 250, 1),
                // ),
                child: ElevatedButton(
                  onPressed: () async {
                    visible = !visible;
                    show = !show;
                    // MicRecord.startListening();
                    // await SoundRecord.startListening();
                    if (isListening) {
                      await SoundRecord.startListening();
                      // setState(() => isListening = false);
                      setState(() {
                        msg = '录音中..';
                        isListening = false;
                      });
                    } else {
                      connect();
                      speak();
                      // visible = !visible;
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
                        MaterialStateProperty.all(Color(0xffffffff)),
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
                //     listen();
                //     setState(() {});
                //     print(text);
                //   },
                // ),
              ),
            ),
            new Positioned(
              bottom: 80.0,
              left: 35.0,
              child: show
                  ? TestCWidget(
                      show: show,
                    )
                  : TestDWidget(
                      show: !show,
                    ),
            )
          ],
        ),

        // ),

        // FloatingActionButton(
        //     child: Icon(Icons.graphic_eq),
        //     onPressed: () {
        //       // visible = !visible;
        //       // setState(() {});
        //       // Navigator.push(
        //       //     context,
        //       //     new MaterialPageRoute(
        //       //         builder: (context) =>
        //       //             new Voice()) //Navigator.push：是跳转到下一个页面，它要接受两个参数一个是上下文context，另一个是要跳转的函数。
        //       //     );
        //       print("弹起语音识别");
        //     },
        //     backgroundColor: Color.fromRGBO(34, 139, 230, 0.8)),
        // FloatingActionButton(
        //     onPressed: () {
        //       listen();
        //       visible = !visible;
        //     },
        //     child: WaterRipple()
        //     // isListening ? Voice() : WaterRipple(),
        //     ),
        // WaterRipple(),
        // visible ? WaterRipple() : NoWaterRipplePage(),
        // isListening ? WaterRipple() : Voice(),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        // floatingActionButton: Container(
        //   height: 80.0,
        //   width: 80.0,
        //   child: AvatarGlow(
        //     animate: isListening,
        //     glowColor: Theme.of(context).primaryColor,
        //     endRadius: 75.0,
        //     duration: const Duration(milliseconds: 2000),
        //     repeatPauseDuration: const Duration(milliseconds: 100),
        //     repeat: true,
        //     child: FloatingActionButton(
        //       onPressed: () {
        //         listen();
        //         visible = !visible;
        //       },
        //       child: Icon(isListening ? Icons.mic : Icons.mic_none),
        //     ),
        //   ),
        //   margin: EdgeInsets.only(top: 40),
        //   padding: EdgeInsets.all(10),
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(45),
        //     color: Color.fromRGBO(250, 250, 250, 1),
        //   ),
        // ),
        body: this._pageList[this._currentIndex],
        bottomNavigationBar: Theme(
          data: ThemeData(
            // 去掉水波纹效果
            splashColor: Colors.transparent,
            // 去掉长按效果
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            currentIndex: this._currentIndex,
            onTap: (int index) {
              setState(() {
                this._currentIndex = index;
              });
            },
            //icon的大小
            //iconSize: 36.0,
            //选中选项颜色
            //fixedColor: Colors.red,
            //背景颜色
            //backgroundColor: Colors.black,
            //设置文字大小
            // selectedFontSize: 12,
            // unselectedFontSize: 12,
            // selectedItemColor: Colors.black,
            // 未选中颜色
            //unselectedItemColor: Color.fromRGBO(117, 117, 117, 1),
            // 选中图标主题
            selectedIconTheme: IconThemeData(
              // 图标颜色
              color: Colors.blue,
              // 图标大小
              size: 28,
              // 图标透明度
              opacity: 1.0,
            ),
            //未选中图标主题
            unselectedIconTheme: IconThemeData(
              color: Colors.black,
              size: 26,
              opacity: 1,
            ),

            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(MyIcon.nav_icon_home_default),
                  activeIcon: Icon(MyIcon.nav_icon_home_selected),
                  label: ('首页'),
                  //去掉长按提示语
                  tooltip: ''),
              BottomNavigationBarItem(
                  icon: Icon(MyIcon.nav_icon_course_default),
                  activeIcon: Icon(MyIcon.nav_icon_course_selected),
                  label: ('课程'),
                  tooltip: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.sms), label: (''), tooltip: ''),
              BottomNavigationBarItem(
                  icon: Icon(MyIcon.nav_icon_find_default),
                  activeIcon: Icon(MyIcon.nav_icon_find_selected),
                  label: ('资讯'),
                  tooltip: ''),
              BottomNavigationBarItem(
                  icon: Icon(MyIcon.nav_icon_user_default),
                  activeIcon: Icon(MyIcon.nav_icon_user_selected),
                  label: ('我的'),
                  tooltip: '')
            ],
          ),
        ));
  }

  connect() async {
    // MicRecord.stopListening();
    await SoundRecord.stopListening();
    setState(() {
      msg = '录音停止,正在语音转文字...';
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
          msg = '语音转文字完成: \r\n$msg';
          print(msg);
        });
      },
    );
    // print(_msg);
  }

  void speak() {
    // visible = !visible;
    tts.setVolume(volume);
    tts.setRate(rate);
    if (languageCode != null) {
      tts.setLanguage(languageCode!);
    }
    tts.setPitch(pitch);
    tts.speak(text);
    // while(){
    //
    // };
  }
// void listen() async {
//   print("155==========================================!!!!!!!!!!!!!!!!");
//   if (!isListening) {
//     print("157==========================================!!!!!!!!!!!!!!!!");
//     bool available = await speech.initialize(
//       onStatus: (val) => print('onStatus: $val'),
//       onError: (val) => print('onError: $val'),
//     );
//     if (available) {
//       print("163==========================================!!!!!!!!!!!!!!!!");
//       setState(() => isListening = true);
//       speech.listen(
//         localeId: 'zh-CN',
//         onResult: (val) => setState(() {
//           text = val.recognizedWords;
//           print(text +
//               "170==========================================!!!!!!!!!!!!!!!!");
//           if (val.hasConfidenceRating && val.confidence > 0) {
//             conf = val.confidence;
//           }
//         }),
//       );
//     }
//   } else {
//     setState(() => isListening = false);
//     speech.stop();
//   }
// }

//悬浮
//   OverlayEntry _entry() {
//     return OverlayEntry(builder: (ctx) {
//       return Positioned(
//           // width: 148,
//           top: _x,
//           // left: 48,
//           right: _y,
//           child: GestureDetector(
//             onPanUpdate: (d) {
//               _x += d.delta.dx;
//               _y += d.delta.dy;
//             },
//             child:
//                 // FloatingActionButton(
//                 //   child: Icon(Icons.add_rounded),
//                 //   onPressed: () {
//                 //     print('yes');
//                 //   },
//                 // ),
//                 // Container(
//                 //   height: 100,
//                 //   width: 375,
//                 //   child: Voice(),
//                 // ),
//                 TestAWidget(
//               visible: visible,
//             ),
//           ));
//     });
//   }
}

// class TestAWidget extends StatelessWidget {
//   final bool visible;
//
//   const TestAWidget({Key? key, required this.visible}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 100,
//       width: 100,
//       child: Voice(),
//     );
//   }
// }

// class NoWaterRipplePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           child: Container(
//         height: 50,
//         width: 50,
//         // margin: EdgeInsets.only(top: 40),
//         // padding: EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(45),
//           color: Colors.blue,
//         ),
//         child: Icon(Icons.graphic_eq),
//       )
//           //         Container(
//           //   height: 80.0,
//           //   width: 80.0,
//           //   margin: EdgeInsets.only(top: 40),
//           //   padding: EdgeInsets.all(10),
//           //   decoration: BoxDecoration(
//           //     borderRadius: BorderRadius.circular(45),
//           //     color: Color.fromRGBO(250, 250, 250, 1),
//           //   ),
//           //   child: FloatingActionButton(
//           //       child: Icon(Icons.graphic_eq),
//           //       onPressed: () {
//           //         // visible = !visible;
//           //         // setState(() {});
//           //         // Navigator.push(
//           //         //     context,
//           //         //     new MaterialPageRoute(
//           //         //         builder: (context) =>
//           //         //             new Voice()) //Navigator.push：是跳转到下一个页面，它要接受两个参数一个是上下文context，另一个是要跳转的函数。
//           //         //     );
//           //         print("弹起语音识别");
//           //       },
//           //       backgroundColor: Color.fromRGBO(34, 139, 230, 0.8)),
//           // )
//           ),
//     );
//   }
// }

class TestAWidget extends StatelessWidget {
  final bool visible;

  const TestAWidget({Key? key, required this.visible}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 300),
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
        child: Icon(Icons.graphic_eq),
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
      child: Container(height: 50, width: 50, child: WaterRipple()),
    );
  }
}

class TestCWidget extends StatelessWidget {
  final bool show;

  const TestCWidget({Key? key, required this.show}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 300),
      opacity: show ? 1.0 : 0.0,
      // child: Container(
      //   color: Colors.blue,
      //   height: 100.0,
      //   child: const Center(
      //     child: Text('TestAWidget'),
      //   ),
      // ),
      child: Container(
        height: 20.0,
        // width: 300.0,
        color: Colors.blue,
        // child: Text(msg),
      ),
    );
  }
}

class TestDWidget extends StatelessWidget {
  final bool show;

  const TestDWidget({Key? key, required this.show}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 300),
      opacity: 0.0,
      // child: Container(
      //   color: Colors.blue,
      //   height: 100.0,
      //   child: const Center(
      //     child: Text('TestAWidget'),
      //   ),
      // ),
      child: Container(
        height: 50.0,
        width: 300.0,
        color: Colors.blue,
      ),
    );
  }
}
