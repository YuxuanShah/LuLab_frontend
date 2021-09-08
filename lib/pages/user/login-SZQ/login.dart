import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'password_login.dart';
import 'phone_login.dart';
import 'register.dart';

class Login1 extends StatelessWidget {
  const Login1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Login(),
    );
  }
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 19,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Text(
              '随便看看    ',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ]),
          const SizedBox(
            height: 19,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text(
              '   欢迎加入陆向谦创新创业实验室',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
          ]),
          const SizedBox(
            height: 50,
          ),
          Container(
            height: 200,
            width: 200,
            // 上边距
            margin: EdgeInsetsDirectional.only(top: 30),
            child: Center(
              // logo 文本
              child: Text(
                "lulab",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),

            decoration: BoxDecoration(
              // logo 背景色
              color: Color(0xff2a67fe),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(
            height: 50,
          ),

          // 微信登录
          Container(
            width: 350,
            height: 40,
            // 上边距
            margin: EdgeInsets.only(top: 100),
            child: ElevatedButton(
              style: ButtonStyle(
                  // 微信登录边框
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  // 背景颜色
                  backgroundColor:
                      MaterialStateProperty.all(Color(0xff2a67fe))),
              child: Text(
                // 文本颜色
                "微信登录",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              onPressed: () {
                print("微信登录");
              },
            ),
          ),
          // 手机号登录
          Container(
            width: 350,
            height: 40,
            // 上边距
            margin: EdgeInsets.only(top: 25),
            child: ElevatedButton(
              // 边框
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
                  backgroundColor:
                      // 背景颜色
                      MaterialStateProperty.all(Color(0xffeaeeff))),
              child: Text(
                // 文本颜色
                "手机号一键登录",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff2c6eff),
                ),
              ),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
          ),
          // // 左右链接
          // Container(
          //   width: 350,
          //   height: 40,
          //   // 上边距
          //   margin: EdgeInsets.only(top: 50),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       TextButton(
          //         child: Text("手机验证登录",
          //             style: TextStyle(color: Color(0xff8a8a8a))),
          //         onPressed: () {
          //           Navigator.of(context).push(
          //               MaterialPageRoute(builder: (context) => PhoneLogin1()));
          //         },
          //       ),
          //       TextButton(
          //           child: Text("账号密码登录",
          //               style: TextStyle(color: Color(0xff8a8a8a))),
          //           onPressed: () {
          //             Navigator.of(context).push(MaterialPageRoute(
          //                 builder: (context) => VerifyCodeLogin1()));
          //           }),
          //       TextButton(
          //           onPressed: () {
          //             Navigator.of(context).push(MaterialPageRoute(
          //                 builder: (context) => TextFieldDemo1()));
          //           },
          //           child: Text('还没注册？点我注册',
          //               style: TextStyle(color: Color(0xff8a8a8a))))
          //     ],
          //   ),
          // ),
          // 协议
          ProtocolButtonWidget(),
        ],
      ),
    );
  }
}
