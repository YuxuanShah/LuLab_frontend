import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../common/widget/widgets.dart';
import '../../common/utils/utils.dart';
import '../../common/values/values.dart';
import '../../common/api/apis.dart';
import '../../common/entitys/entitys.dart';
import '../../common/global/global.dart';

import '../app.dart';
import '../sign_up/register.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // 账号控制器
  final TextEditingController _emailController =
      TextEditingController(text: "shiming");
  // 密码控制器
  final TextEditingController _passController =
      TextEditingController(text: "12345678");

  // 跳转 注册界面
  // _handleNavSignUp() {
  //   ExtendedNavigator.rootNavigator.pushNamed(Routes.signUpPageRoute);
  // }

  // 执行登录操作
  _handleSignIn() async {
    if (!duCheckStringLength(_passController.value.text, 6)) {
      toastInfo(msg: '密码不能小于6位');
      return;
    }

    Loginrequest variables = Loginrequest(
      name: _emailController.value.text,
      password: _passController.value.text,
      // password: duSHA256(_passController.value.text),
    );

    try {
      UserLogin userProfile = await GqlUserAPI.login(
        context: context,
        variables: variables,
      );
      Global.saveProfile(userProfile);
    } catch (e) {
      if (kDebugMode) {
        print("===========登录报错内容===============");
        print(e);
      }
      return toastInfo(msg: '请正确输入账号、密码！');
    }

    // ExtendedNavigator.rootNavigator
    //     .pushReplacementNamed(Routes.applicationPageRoute);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const App()));
  }

  // 登录表单
  Widget _buildInputForm() {
    return Container(
      //width: fitWidth(295),
      // height: 204,
      margin: EdgeInsets.only(top: fitHeight(49)),
      child: Column(
        children: [
          SizedBox(
            height: 250.h,
          ),
          //输入账号
          inputTextEdit(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              hintText: "请输入账号",
              marginTop: 0,
              autofocus: true,
              width: 622,
              height: 112),
          // 输入密码
          inputTextEdit(
              controller: _passController,
              keyboardType: TextInputType.visiblePassword,
              hintText: "请输入密码",
              isPassword: true,
              marginTop: 50,
              width: 622,
              height: 112),

          // 登录
          Container(
            //height: 100.h,
            margin: const EdgeInsets.only(top: 50),
            child: btnFlatButtonWidget(
              width: 622,
              height: 112,
              onPressed: () => _handleSignIn(),
              gbColor: AppColors.primaryElement,
              title: "登录",
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          Text.rich(TextSpan(
            children: [
              TextSpan(
                  text: "没有账号？点击注册",
                  style: const TextStyle(
                      fontSize: 25, color: Color.fromARGB(234, 46, 199, 32)),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SignUpPage()));
                    }),
            ],
          )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: <Widget>[
            _buildInputForm(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
