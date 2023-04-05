import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/services.dart';
import 'package:sakecbot/NavBar/about.dart';
import 'package:sakecbot/dry/tts.dart';
import 'package:sakecbot/text_to_speech.dart';
import 'dry/pallete.dart';
import 'speech_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  TextToSpeech.init();
  runApp(const SakecBot());
}

class SakecBot extends StatelessWidget {
  const SakecBot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        appBarTheme: AppBarTheme(backgroundColor: Pallete.appBarColor),
      ),
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splashTransition: SplashTransition.scaleTransition,
        splash: 'assets/images/splashlogo.png',
        nextScreen: ChatScreen(),
        backgroundColor: Pallete.themeColor,
        splashIconSize: 500,
      ),
      routes: {
        '/first': (context) => AboutApp(),
        '/second': (context) => ChatScreen(),
        '/chatscreen': (context) => TTSScreen(),
      },
    );
  }
}
