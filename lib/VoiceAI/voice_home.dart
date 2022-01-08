import 'package:flutter/material.dart';

import 'voice.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('语音识别测试demo'),
        ),
        body: Center(
          child: TextButton(
            child: const Text(
              '点击测试语音识别\nTap to test Voice',
              style: TextStyle(fontSize: 20.0),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const Voice(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
