import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import 'voice_home.dart';

class Voice extends StatelessWidget {
  const Voice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Voice',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Speech(),
    );
  }
}

class Speech extends StatefulWidget {
  const Speech({Key? key}) : super(key: key);

  @override
  _SpeechState createState() => _SpeechState();
}

class _SpeechState extends State<Speech> {
  final Map<String, HighlightedWord> highlight = {
    'flutter': HighlightedWord(
      onTap: () => print('flutter'),
      textStyle: const TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold,
      ),
    ),
    'voice': HighlightedWord(
      onTap: () => print('voice'),
      textStyle: const TextStyle(
        color: Colors.blueGrey,
        fontWeight: FontWeight.bold,
      ),
    ),
    'application': HighlightedWord(
      onTap: () => print('application'),
      textStyle: const TextStyle(
        color: Colors.orange,
        fontWeight: FontWeight.bold,
      ),
    ),
    'android': HighlightedWord(
      onTap: () => print('android'),
      textStyle: const TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.bold,
      ),
    ),
    'apple': HighlightedWord(
      onTap: () => print('apple'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'country': HighlightedWord(
      onTap: () => print('country'),
      textStyle: const TextStyle(
        color: Colors.deepPurpleAccent,
        fontWeight: FontWeight.bold,
      ),
    ),
    'lake': HighlightedWord(
      onTap: () => print('lake'),
      textStyle: const TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold,
      ),
    ),
  };

  late stt.SpeechToText speech;
  bool isListening = false;
  String text = '点击语音按钮讲话';
  double conf = 1.0;

  @override
  void initState() {
    super.initState();
    speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Confidence: ${(conf*100.0).toStringAsFixed(1)}%'),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Confidence: ${(conf * 100.0).toStringAsFixed(1)}%'),
            TextButton.icon(
              label: const Text("Exit"),
              icon: const Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const Home(),
                  ),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: isListening,
        glowColor: Theme.of(context).primaryColor,
        endRadius: 75.0,
        duration: const Duration(milliseconds: 2000),
        repeatPauseDuration: const Duration(milliseconds: 100),
        repeat: true,
        child: FloatingActionButton(
          onPressed: listen,
          child: Icon(isListening ? Icons.mic : Icons.mic_none),
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 150.0),
          child: TextHighlight(
            text: text,
            words: highlight,
            textStyle: const TextStyle(
              fontSize: 30.0,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  void listen() async {
    print("155==========================================!!!!!!!!!!!!!!!!");
    if (!isListening) {
      print("157==========================================!!!!!!!!!!!!!!!!");
      bool available = await speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        print("163==========================================!!!!!!!!!!!!!!!!");
        setState(() => isListening = true);
        speech.listen(
          localeId: 'zh-CN',
          onResult: (val) => setState(() {
            text = val.recognizedWords;
            print(text +
                "170==========================================!!!!!!!!!!!!!!!!");
            if (val.hasConfidenceRating && val.confidence > 0) {
              conf = val.confidence;
            }
          }),
        );
      }
    } else {
      setState(() => isListening = false);
      speech.stop();
    }
  }
}
