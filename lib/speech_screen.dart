import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:sakecbot/api/api_services.dart';
import 'package:sakecbot/dry/chat_bubble.dart';
import 'package:sakecbot/dry/chat_model.dart';
import 'package:sakecbot/dry/pallete.dart';
import 'package:sakecbot/NavBar/nav_bar.dart';
import 'package:sakecbot/dry/tts.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'dry/theme.dart';
import 'dry/chat_theme.dart';

class SpeechScreen extends StatefulWidget {
  const SpeechScreen({super.key});

  @override
  State<SpeechScreen> createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {
  SpeechToText speechToText = SpeechToText();
  var text = "Hold the button and start speeking";
  var isListening = false;

  final List<ChatMessage> messages = [];

  var scrollController = ScrollController();

  scrollMethod() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Pallete.themeColor,
      drawer: NavBar(),
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: CustomeTheme(
          begning: Alignment.topRight,
          end: Alignment.centerRight,
        ),
        title: Text(
          'SAKEC-BOT',
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              text,
              style: TextStyle(
                color: isListening ? Colors.white : Colors.grey,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Expanded(
              child: ChatTheme(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                radius: BorderRadius.circular(15),
                begning: Alignment.bottomRight,
                end: Alignment.topRight,
                chatBubble: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: scrollController,
                  shrinkWrap: true,
                  itemCount: messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    var chat = messages[index];
                    return chatBubble(
                      chattext: chat.text,
                      type: chat.type,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: AvatarGlow(
        endRadius: 75,
        animate: isListening,
        repeat: true,
        repeatPauseDuration: Duration(milliseconds: 100),
        showTwoGlows: true,
        duration: Duration(milliseconds: 2000),
        child: GestureDetector(
          onTapDown: (details) async {
            if (!isListening) {
              var available = await speechToText.initialize();
              if (available) {
                setState(() {
                  isListening = true;
                  speechToText.listen(
                    onResult: (result) {
                      setState(() {
                        text = result.recognizedWords;
                      });
                    },
                  );
                });
              }
            }
          },
          onTapUp: (details) async {
            setState(() {
              isListening = false;
            });
            await speechToText.stop();
            if (text.isNotEmpty &&
                text != "Hold the button and start speeking") {
              messages.add(ChatMessage(text: text, type: ChatMessageType.user));
              var msg = await ApiServices.sendMessage(text);
              msg = msg.trim();
              setState(() {
                messages.add(ChatMessage(text: msg, type: ChatMessageType.bot));
              });
              Future.delayed(Duration(milliseconds: 500), () {
                TextToSpeech.speak(msg);
              });
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("failed to process. Try again!"),
                ),
              );
            }
          },
          child: CircleAvatar(
            backgroundColor: Pallete.themeColor,
            radius: 40,
            child: Icon(
              size: 35,
              isListening ? Icons.mic : Icons.mic_none,
            ),
          ),
        ),
      ),
    );
  }
}
