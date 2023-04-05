import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeech {
  static FlutterTts tts = FlutterTts();

  static init() {
    tts.setLanguage('en-IN');
    tts.setVolume(1.0);
  }

  static speak(String text) async {
    tts.setStartHandler(() {
      print("TTS is started");
    });
    tts.setCompletionHandler(() {
      print("Completed");
    });
    tts.setErrorHandler((message) {
      print(message);
    });
    await tts.awaitSpeakCompletion(true);
    tts.speak(text);
  }
}
