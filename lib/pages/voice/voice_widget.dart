import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:proflu/common/entitys/speaking_status.dart';
import 'package:proflu/common/utils/utils.dart';
import 'package:proflu/common/values/values.dart';
import 'package:proflu/controller/index_controller.dart';

import '../../common/widget/blur_rect_widget.dart';

class VoiceWidget extends StatefulWidget {
  const VoiceWidget({Key? key}) : super(key: key);

  @override
  State<VoiceWidget> createState() => _VoiceWidgetState();
}

class _VoiceWidgetState extends State<VoiceWidget> {
  final String _text = "你好我想问一下陆向谦实验室是什么,还有我想问下陆向谦教授是哪位呢?";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IndexController>(builder: (ic) {
      switch (ic.status) {
        case SpeakingStatus.userSpeaking:
          return _userSpeakingWidget(ic);
        case SpeakingStatus.aiSpeaking:
          return _aiSpeakingWidget();
        case SpeakingStatus.parseFailed:
          return _errorWidget();
        default:
          return Container();
      }
    });
  }

  Widget _userSpeakingWidget(IndexController ic) {
    if (ic.userWord.isEmpty) {
      return _swiperWidget();
    }
    return _container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _text,
            style: const TextStyle(fontSize: 16),
          ),
          // const SizedBox(height: 10),
          // Lottie.asset(
          //   'assets/animation/wave2.json',
          //   width: 420.w,
          //   height: 74.w,
          // )
        ],
      ),
      height: 350.w,
    );
  }

  Widget _swiperWidget() {
    return _container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "试试这样和我说",
            style: TextStyle(
              fontSize: 18,
              color: PFc.themeColor,
            ),
          ),
          SizedBox(
            height: 80.w,
            child: Swiper(
              itemBuilder: (c, i) {
                return Center(
                  child: Text(
                    IndexController.to.hints[i],
                    style: const TextStyle(fontSize: 16),
                  ),
                );
              },
              itemCount: IndexController.to.hints.length,
              autoplay: true,
              scrollDirection: Axis.vertical,
            ),
          ),
          Lottie.asset(
            'assets/animation/wave2.json',
            width: 420.w,
            height: 74.w,
          )
        ],
      ),
      height: 350.w,
    );
  }

  Widget _aiSpeakingWidget() {
    return _container(
      child: Center(
        child: Lottie.asset(
          'assets/animation/wave2.json',
          width: 420.w,
          height: 74.w,
        ),
      ),
      height: 280.w,
    );
  }

  Widget _errorWidget() {
    return _container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "抱歉我没听懂,请再说一遍",
            style: TextStyle(
              fontSize: 32.w,
            ),
          ),
          SizedBox(height: 20.w),
          Lottie.asset(
            'assets/animation/wave2.json',
            width: 420.w,
            height: 74.w,
          ),
        ],
      ),
      height: 280.w,
    );
  }

  Widget _withLogoWidget(
      {required Widget child, required double width, double? height}) {
    return _container(
        child: Row(
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png',
              width: 144.w,
              height: 144.w,
            ),
            SizedBox(width: 10.w),
            Container(
              width: width,
              height: 100.w,
              decoration: BoxDecoration(
                color: const Color(0xffEEEEEE),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.w),
                  topRight: Radius.circular(30.w),
                  bottomRight: Radius.circular(30.w),
                ),
              ),
              alignment: Alignment.center,
              child: child,
            )
          ],
        ),
        height: height);
  }

  Widget _container({
    required Widget child,
    double? height,
  }) {
    return BlurRectWidget(
      child: Container(
        height: height ?? 350.w,
        width: 750.w,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: child,
      ),
    );
  }
}
