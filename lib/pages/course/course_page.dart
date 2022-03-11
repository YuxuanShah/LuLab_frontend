import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:proflu/common/values/colors.dart';
import 'package:proflu/common/values/values.dart';

import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
import '../../common/utils/utils.dart';
import '../../common/widget/widgets.dart';
import 'course_index.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({Key? key}) : super(key: key);

  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  late MainCourseRequest _postsData;
  List _focusData = [];

  int _selectIndex = 0;

  //课程类别框宽：课程详情框宽=0.293：0.707，Sliver Ratio
  final double _selectColumnsWidth = 1.sw * 0.293 - 12.w;
  final double _coursesDetailsWidth = 1.sw * (1 - 0.293) - 16.w;

  final List _courseList = ['理论课程', '大咖访谈', '往期课程', '精彩例会', '举例1', '举例2'];

  @override
  void initState() {
    super.initState();
    _loadAllData();
  }

  // 读取所有课程数据
  _loadAllData() async {
    _postsData = await MainCourseAPI.maincourse(schema: '', context: context);
    var focusList = _postsData.data.latestMainCourse;

    setState(() {
      _focusData = focusList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //由主题统一配色，不在这里重新设定颜色
        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          '课程',
          style: TextStyle(
            fontFamily: 'MyFontStyle',
            color: AppColors.emphasisText,
            fontSize: 24,
          ),
        ),
        // title: InkWell(
        //   //onTap是点击事件回调
        //   onTap: () {
        //     Navigator.pushNamed(context, '/search');
        //   },
        //   child: Container(
        //     height: 30.0,
        //     padding: const EdgeInsets.only(left: 15),
        //     decoration: BoxDecoration(
        //         //改变搜索外框颜色
        //         //border: Border.all(color: Colors.black),
        //         color: const Color.fromRGBO(230, 230, 230, 0.8),
        //         borderRadius: BorderRadius.circular(15)),
        //     child: Row(children: const <Widget>[
        //       Icon(
        //         Icons.search,
        //         color: (Color.fromRGBO(89, 89, 89, 1)),
        //       ),
        //       Text(
        //         "开始搜索",
        //         //textAlign: TextAlign.center,
        //         style: TextStyle(
        //           color: Color.fromRGBO(89, 89, 89, 1),
        //           fontSize: 15,
        //         ),
        //       )
        //     ]),
        //   ),
        // ),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         if (kDebugMode) {
        //           print("跳转到观看历史");
        //         }
        //         Navigator.pushNamed(context, '/history');
        //       },
        //       icon: const Icon(
        //         Icons.history,
        //         color: Color.fromRGBO(117, 117, 117, 1),
        //       ))
        // ],
      ),
      body: Container(
        decoration: const BoxDecoration(color: AppColors.secondaryBackground),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: _selectColumnsWidth,
              child: Column(
                children: [
                  SizedBox(
                    height: _courseList.length * _selectColumnsWidth * 0.618,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _courseList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              if (kDebugMode) {
                                print(DateTime.now());
                                print('点击了' + _courseList[index]);
                                print(100.h);
                                print(100.w);
                                // print(DateTime.now().millisecondsSinceEpoch);
                                // print(DateTime.fromMillisecondsSinceEpoch(
                                //     DateTime.now().millisecondsSinceEpoch));
                              }
                              _selectIndex = index;
                            });
                          },
                          child: Container(
                            width: double.infinity,
                            height: _selectColumnsWidth * 0.618,
                            decoration: BoxDecoration(
                                color: _selectIndex == index
                                    ? Colors.white
                                    : const Color.fromRGBO(246, 246, 246, 1),
                                borderRadius: _selectIndex == index
                                    ? null
                                    : _selectIndex == index + 1
                                        ? const BorderRadius.only(
                                            bottomRight: Radius.circular(10),
                                          )
                                        : _selectIndex == index - 1
                                            ? const BorderRadius.only(
                                                topRight: Radius.circular(10))
                                            : null),
                            child: Center(
                              child: Text(_courseList[index],
                                  style: _selectIndex == index
                                      ? const TextStyle(
                                          fontFamily: 'MyFontStyle',
                                          color: Color.fromRGBO(51, 51, 51, 1),
                                          fontSize: 20,
                                        )
                                      : const TextStyle(
                                          color:
                                              Color.fromRGBO(136, 136, 136, 1),
                                          fontSize: 18,
                                        ),
                                  textAlign: TextAlign.center),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: _selectColumnsWidth * 0.618,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Container(
                          width: double.infinity,
                          height: _selectColumnsWidth * 0.618,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(246, 246, 246, 1),
                              borderRadius:
                                  _selectIndex == _courseList.length - 1
                                      ? const BorderRadius.only(
                                          topRight: Radius.circular(10))
                                      : null),
                        );
                      },
                    ),
                  ),
                  Flexible(
                      child: Container(
                    color: const Color.fromRGBO(246, 246, 246, 1),
                    width: _selectColumnsWidth,
                  )),
                ],
              ),
            ),
            Flexible(
                child: Container(
              decoration: const BoxDecoration(color: Colors.white),
              padding: EdgeInsets.only(left: 12.w, right: 16.w),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _focusData.length,
                itemBuilder: (context, index) {
                  if (_focusData.isNotEmpty) {
                    return InkWell(
                      onTap: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CourseIndexPage(
                                    product: _focusData[index])));
                      },
                      child: Container(
                        height: _coursesDetailsWidth * 0.414,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          //border: Border.all(color: Colors.black54),
                        ),
                        //margin: const EdgeInsets.only(bottom: 10),
                        child: Stack(
                          children: <Widget>[
                            // 课程封面
                            positionedImage(
                                context: context,
                                top: 15.h,
                                left: 16.w,
                                height: _coursesDetailsWidth * 0.414 - 16.w * 2,
                                width:
                                    (_coursesDetailsWidth * 0.414 - 16.w * 2) *
                                        (3 / 4),
                                url: _focusData[index].imgUrl),
                            // 课程标题
                            positioningText(
                                context: context,
                                top: 15.h,
                                left: 16.w +
                                    (_coursesDetailsWidth * 0.414 - 16.w * 2) *
                                        (3 / 4) +
                                    16.w,
                                height: 80.h,
                                width: 355.w,
                                text: _focusData[index].title,
                                font: 'MyFontStyle'),
                            // 作者
                            positioningText(
                                context: context,
                                top: 55.h,
                                left: 16.w +
                                    (_coursesDetailsWidth * 0.414 - 16.w * 2) *
                                        (3 / 4) +
                                    16.w,
                                height: 80.h,
                                width: 700.w,
                                text: _focusData[index].author),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return const Text('加载中...');
                  }
                },
              ),
            ))
          ],
        ),
      ),
    );
  }
}
