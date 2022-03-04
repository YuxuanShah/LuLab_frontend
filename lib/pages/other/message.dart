import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proflu/common/api/gql_latestrecord.dart';
import 'package:proflu/common/entitys/latestrecord_data.dart';
import 'package:proflu/common/global/global.dart';
import 'package:proflu/common/widget/positioned_widget.dart';

import 'message_detail.dart';

class Message extends StatefulWidget {
  const Message({Key? key}) : super(key: key);

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  late LatestRecord _latestRecord;
  var _recordData;

  @override
  void initState() {
    super.initState();
    _loadMessageData();
  }

  // 读取所有数据
  _loadMessageData() async {
    LatestRecordRequest variables = LatestRecordRequest(
      authorId: Global.profile.data.id,
    );
    _latestRecord = await GqlLatestRecordAPI.indexPageInfo(
        variables: variables, context: context);
    var recordData = _latestRecord.latestRecord;

    setState(() {
      _recordData = recordData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
        title: const Text(
          "通知区",
          style: TextStyle(
            fontFamily: 'MyFontStyle',
            color: Colors.black,
            fontSize: 24,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: _recordData.length,
        itemBuilder: (context, index) {
          if (_recordData.isNotEmpty) {
            return InkWell(
              onTap: () async {
                if (kDebugMode) {
                  print('到通知详情');
                }
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            MessageDetail(product: _recordData[index])));
              },
              child: Container(
                height: 170.h,
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                margin: EdgeInsets.only(bottom: 10.h, left: 30.w, right: 30.w),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
                child: Stack(
                  children: <Widget>[
                    // 资讯封面
                    positionedImage(
                        context: context,
                        top: 10,
                        left: 10,
                        height: 150,
                        width: 150,
                        url: _recordData[index].imgUrl),
                    // 资讯标题
                    positionedText(
                        context: context,
                        top: 30,
                        left: 180,
                        height: 90,
                        width: 500,
                        text: _recordData[index].title),
                    // 观看次数
                    // positionedText(
                    //     context: context,
                    //     top: 60,
                    //     left: 180,
                    //     height: 40,
                    //     width: 200,
                    //     text: "test"),
                  ],
                ),
              ),
            );
          } else {
            return Container(
              height: 100,
              width: 200,
              color: Colors.black12,
              child: const Text("加载中。。。。。"),
            );
          }
        },
      ),
    );
  }
}
