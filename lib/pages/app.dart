import 'package:flutter/material.dart';
import 'package:proflu/pages/voice/voice_view.dart';

import '../common/values/values.dart';
//import '../common/widget/widgets.dart';
import 'course/course_page.dart';
import 'home/home_page.dart';
import 'source/Information_page.dart';
import 'users/users_page.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentIndex = 0;

  //late DateTime _lastPressedAt; //上次点击时间

  final List _pageList = [
    const HomePage(),
    const CoursePage(),
    const VoiceView(),
    const InformationPage(),
    const UsersPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return
        // WillPopScope(
        //   //防止误触退出app
        //   onWillPop: () async {
        //     //两次点击间隔超过1秒则重新计时
        //     if (DateTime.now().difference(_lastPressedAt) >
        //         const Duration(seconds: 1)) {
        //       _lastPressedAt = DateTime.now();
        //       toastInfo(msg: '再按一次退出');
        //       return false;
        //     }
        //     return true;
        //   },
        //   child:

        Scaffold(
      // 语音识别按钮
      floatingActionButton: const VoiceView(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: _pageList[_currentIndex],
      bottomNavigationBar: Theme(
        data: ThemeData(
          // 去掉水波纹效果
          splashColor: Colors.transparent,
          // 去掉长按效果
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          // 选中图标主题
          selectedIconTheme: const IconThemeData(
            // 图标颜色
            color: Color.fromRGBO(77, 196, 96, 1),
            // 图标大小
            size: 28,
            // 图标透明度
            opacity: 1.0,
          ),
          //选中字体颜色
          selectedLabelStyle: const TextStyle(
            fontFamily: 'MyFontStyle',
            color: Color.fromRGBO(77, 196, 96, 1),
          ),
          //未选中图标主题
          unselectedIconTheme: const IconThemeData(
            color: Colors.black,
            size: 26,
            opacity: 1,
          ),
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(MyIcon.navIconHomeDefault),
                activeIcon: Icon(MyIcon.navIconHomeSelected),
                label: ('首页'),
                //去掉长按提示语
                tooltip: ''),
            BottomNavigationBarItem(
                icon: Icon(MyIcon.navIconCourseDefault),
                activeIcon: Icon(MyIcon.navIconCourseSelected),
                label: ('课程'),
                tooltip: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.sms), label: (''), tooltip: ''),
            BottomNavigationBarItem(
                icon: Icon(MyIcon.navIconFindDefault),
                activeIcon: Icon(MyIcon.navIconFindSelected),
                label: ('资讯'),
                tooltip: ''),
            BottomNavigationBarItem(
                icon: Icon(MyIcon.navIconUserDefault),
                activeIcon: Icon(MyIcon.navIconUserSelected),
                label: ('我的'),
                tooltip: '')
          ],
        ),
      ),
      //),
    );
  }
}
