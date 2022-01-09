import 'dart:async';

import 'package:flutter/material.dart';

import 'voice.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Voice())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: FlutterLogo(size: MediaQuery.of(context).size.height));
  }
}
