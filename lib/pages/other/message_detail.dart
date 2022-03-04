import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageDetail extends StatefulWidget {
  const MessageDetail({Key? key, required this.product}) : super(key: key);
  final product;
  @override
  State<MessageDetail> createState() => _MessageDetailState();
}

class _MessageDetailState extends State<MessageDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          '详情',
          style: TextStyle(
            fontFamily: 'MyFontStyle',
            color: Colors.green,
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
              height: 1082.h,
              width: 800.w,
              color: Colors.white,
              child: SingleChildScrollView(
                child: Center(
                    child: Column(
                  children: <Widget>[
                    Text(
                      widget.product.title,
                      style: TextStyle(
                        fontFamily: 'MyFontStyle',
                        color: Colors.black,
                        fontSize: 22,
                      ),
                    ),
                    Container(
                      width: 800.w,
                      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                      child: Text(
                        widget.product.description,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                )),
              )),
        ],
      ),
    );
  }
}
