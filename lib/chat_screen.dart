import 'package:flutter/material.dart';
import 'package:sakecbot/pallete.dart';
import 'dry/theme.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var text = "Hold the button and start speeking";

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
        margin: EdgeInsets.only(bottom: 150),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      floatingActionButton: CircleAvatar(
        backgroundColor: Pallete.floatingButtonColor,
        radius: 40,
        child: Icon(
          size: 35,
          Icons.mic,
        ),
      ),
    );
  }
}
