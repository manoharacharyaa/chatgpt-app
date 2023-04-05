import 'package:flutter/material.dart';
import 'package:sakecbot/dry/tts.dart';

class TTSScreen extends StatelessWidget {
  const TTSScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var textController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Speech To Text'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: textController,
          ),
          ElevatedButton(
            onPressed: () {
              TextToSpeech.speak(textController.text);
            },
            child: Text('Speak'),
          ),
        ],
      ),
    );
  }
}
