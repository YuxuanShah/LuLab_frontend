import 'package:flutter/material.dart';
import 'user_agreement.dart';
import 'LoginPage.dart';
import 'password_login.dart';

class PhoneLogin1 extends StatelessWidget {
  const PhoneLogin1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("TextFieldDemo"),
      // ),
      body: PhoneLogin(),
    );
  }
}

class PhoneLogin extends StatelessWidget {
  const PhoneLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          BackLineWidget(),
          // logo
          LogoIconWidget(),
          // 手机号
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: PhoneFieldWidget(),
          ),
          SizedBox(
            height: 10,
          ),
          // 验证码
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: VerifyFieldWidget(),
          ),
          SizedBox(
            height: 10,
          ),
          // 提交
          SubmitButtonWidget(),
          // 协议
          ProtocolButtonWidget(),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 350,
            height: 30,
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
          SizedBox(
            height: 10,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            TextButton(
              child: Image.asset(
                'images/QQ.png',
                height: 24,
                width: 24,
              ),
              autofocus: true,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(StadiumBorder()),
                minimumSize: MaterialStateProperty.all(Size(36, 36)),
                side: MaterialStateProperty.all(
                    BorderSide(color: Colors.grey, width: 1)),
              ),
              onPressed: () {},
            ),
            const SizedBox(
              width: 40.0,
            ),
            TextButton(
              child: Image.asset(
                'images/微博.png',
                height: 24,
                width: 24,
              ),
              autofocus: true,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(StadiumBorder()),
                minimumSize: MaterialStateProperty.all(Size(36, 36)),
                side: MaterialStateProperty.all(
                    BorderSide(color: Colors.grey, width: 1)),
              ),
              onPressed: () {},
            ),
          ]),
        ],
      ),
    );
  }
}

// 返回标志
// ignore: must_be_immutable
class BackLineWidget extends StatelessWidget {
  BackLineWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            margin: EdgeInsets.only(left: 30, top: 20),
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => LoginPage()));
              },
            )),
        Container(
          margin: EdgeInsets.only(top: 30, right: 20),
          child: TextButton(
            child: Text(
              '密码登录',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
            ),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => VerifyCodeLogin1()));
            },
          ),
        ),
      ],
    );
  }
}

// logo图标
class LogoIconWidget extends StatelessWidget {
  const LogoIconWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 100,
          width: 100,
          // 上边距
          margin: EdgeInsets.only(top: 50, left: 230, bottom: 50),
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
      ],
    );
  }
}

// 手机号
class PhoneFieldWidget extends StatelessWidget {
  const PhoneFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.phone),
        hintText: "请输入手机号",
      ),
    );
  }
}

// 发送验证码
class SendVerifyCodeWidget extends StatelessWidget {
  const SendVerifyCodeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: 100,
      height: 30,
      top: 5,
      right: 20,
      child: TextButton(
        style: ButtonStyle(
          side: MaterialStateProperty.all(
              BorderSide(color: Colors.blue, width: 1)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        ),
        child: Text(
          "发送验证码",
        ),
        onPressed: () {},
      ),
    );
  }
}

// 验证码
class VerifyFieldWidget extends StatelessWidget {
  const VerifyFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextField(
          obscureText: true,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.verified_user_rounded),
            hintText: "请输入验证码",
          ),
        ),
        // 发送验证码
        SendVerifyCodeWidget()
      ],
    );
  }
}

// 提交按钮
class SubmitButtonWidget extends StatelessWidget {
  const SubmitButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
              backgroundColor: MaterialStateProperty.all(Color(0xff0079fe))),
          onPressed: () {},
          child: Text(
            "提交",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              textBaseline: TextBaseline.alphabetic,
            ),
          ),
        ),
      ),
    );
  }
}

// 协议
class ProtocolButtonWidget extends StatefulWidget {
  ProtocolButtonWidget({Key? key}) : super(key: key);

  @override
  _ProtocolButtonWidgetState createState() => _ProtocolButtonWidgetState();
}

class _ProtocolButtonWidgetState extends State<ProtocolButtonWidget> {
  var a = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
      width: 350,
      height: 20,
      // 上边距
      margin: EdgeInsets.only(top: 50),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Checkbox(
          value: this.a,
          onChanged: (v) {
            setState(() {
              this.a = v!;
            });
          },
        ),
        Text(
          "我同意并愿意遵守",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xffadadad),
          ),
        ),
        TextButton(
          child: Text(
            '用户协议',
            style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => UserAgreement()));
          },
        ),
        Text(
          "与",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xffadadad),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            '隐私政策',
            style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ]),
    ));
  }
}
