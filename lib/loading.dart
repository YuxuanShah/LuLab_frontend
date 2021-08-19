import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Image.network(
        'https://upload-images.jianshu.io/upload_images/10847113-fd49786e5f26f7a3.jpg?',
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    countDown();
  }

  void countDown() {
    var _duration = Duration(seconds: 3);
    print("LuLab程序启动....");
    Future.delayed(_duration, _app);
  }

  void _app() {
    Navigator.of(context).pushReplacementNamed('/App');
  }
}
