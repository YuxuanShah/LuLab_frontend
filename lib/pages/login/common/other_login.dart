import 'package:flutter/material.dart';

class OtherLogin extends StatelessWidget {
  const OtherLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipOval(
            child: Image.asset(
              'images/login_icon/qq.png',
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          ClipOval(
            child: Image.asset(
              'images/login_icon/wx.png',
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          ClipOval(
            child: Image.asset(
              'images/login_icon/wb.png',
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
