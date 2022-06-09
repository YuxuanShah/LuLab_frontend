import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lab/pages/sign_in/sign_in.dart';
import 'package:lab/pages/sign_in/widget_agreement.dart';
import 'package:lab/pages/sign_in/widget_phone_field.dart';

import '../../common/global/global.dart';
import '../../common/staticdata/staticdata.dart';
import '../../common/values/values.dart';
import '../../common/widget/widgets.dart';
import '../../common/utils/utils.dart';
import '../../controller/quick_login_controller.dart';
import '../../controller/signin_controller.dart';
import 'verification.dart';

class PhoneLogin extends StatefulWidget {
  const PhoneLogin({Key? key}) : super(key: key);

  @override
  State<PhoneLogin> createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  final SigninController c = Get.put(SigninController());

  bool _checked = false;

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          height: 1.sh,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/OJJ12.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Center(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      height: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // IconButton(
                          //   icon: const Icon(Icons.keyboard_arrow_left,
                          //       color: Colors.black),
                          //   onPressed: () {
                          //     Navigator.of(context).push(MaterialPageRoute(
                          //         builder: (context) => const SignInPage()));
                          //   },
                          // ),
                          SvgPicture.asset("assets/images/logo.svg",
                              height: 100.h),
                          SvgPicture.asset("assets/images/proflu_text.svg"),
                        ],
                      ),
                    ),
                    SizedBox(height: 150.h),
                    PhoneField(controller: controller),
                    SizedBox(height: 50.h),
                    _submitButton(),
                    SizedBox(height: 50.h),
                    Center(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "密码登录",
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.grey),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  QuickLoginController qc =
                                      Get.put(QuickLoginController());
                                  Get.to(const SignInPage());
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                    AgreementWidget(
                      checked: _checked,
                      onChanged: (v) {
                        PFVibrate.feedback(Type.medium);
                        setState(() {
                          _checked = v!;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _submitButton() {
    return Container(
      // alignment: const Alignment(0.1, 0.1),
      width: 1.sw - 2 * 80.w,
      height: 96.h,
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      //padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
            backgroundColor: MaterialStateProperty.all(
                PFcheck.duIsPhone(controller.value.text)
                    ? PFc.themeColor
                    : const Color.fromARGB(221, 196, 236, 201))),
        onPressed: () {
          print(Global.packageInfo.packageName);
          if (!PFcheck.duIsPhone(controller.value.text)) {
            toastInfo(msg: '号码格式不正确');
          } else if (PFcheck.duIsPhone(controller.value.text) && !_checked) {
            Get.defaultDialog(
              title: "提示",
              content: RichText(
                text: TextSpan(
                  text: '请先同意',
                  style: const TextStyle(color: Colors.black, fontSize: 13.0),
                  children: <TextSpan>[
                    TextSpan(
                      text: '《服务协议》',
                      style: const TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          Get.toNamed(
                            "/agreement",
                            arguments: {
                              "content": Markdowndata.agreementUser,
                              "title": "《服务协议》"
                            },
                          );
                        },
                    ),
                    const TextSpan(text: '和'),
                    TextSpan(
                      text: '《隐私政策》',
                      style: const TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          Get.toNamed(
                            "/agreement",
                            arguments: {
                              "content": Markdowndata.privacy,
                              "title": "《隐私政策》"
                            },
                          );
                        },
                    ),
                  ],
                ),
              ),
              textConfirm: "确认",
              textCancel: "取消",
              confirmTextColor: Colors.black,
              cancelTextColor: Colors.black,
              radius: 5,
              onConfirm: () {
                Get.to(
                  const Verification(),
                  arguments: [controller.value.text, c.code],
                );
              },
            );
          } else if (PFcheck.duIsPhone(controller.value.text) && _checked) {
            Get.to(
              const Verification(),
              arguments: [controller.value.text, c.code],
            );
          } else {}
        },
        child: const Text(
          "获取验证码",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            textBaseline: TextBaseline.alphabetic,
          ),
        ),
      ),
    );
  }
}
