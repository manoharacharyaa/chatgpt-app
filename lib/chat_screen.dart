import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:sakecbot/dry/chat_bubble.dart';
import 'package:sakecbot/dry/chat_model.dart';
import 'package:sakecbot/pallete.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'dry/theme.dart';
import 'dry/chat_theme.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  SpeechToText speechToText = SpeechToText();
  var text = "Hold the button and start speeking";
  var isListening = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Pallete.themeColor,
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
                begning: Alignment.topLeft,
                end: Alignment.bottomRight,
                chatBubble: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return chatBubble(
                      chattext: "How are you doing",
                      type: ChatMessageType.user,
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
          onTapUp: (details) {
            setState(() {
              isListening = false;
            });
            speechToText.stop();
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
