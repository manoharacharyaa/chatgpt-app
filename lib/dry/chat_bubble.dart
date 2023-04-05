import 'package:flutter/material.dart';
import 'package:sakecbot/dry/chat_model.dart';
import 'package:sakecbot/dry/pallete.dart';

Widget chatBubble({required chattext, required ChatMessageType? type}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CircleAvatar(
        backgroundColor: type == ChatMessageType.user
            ? Pallete.themeColor
            : Colors.transparent,
        child: type == ChatMessageType.bot
            ? Image.asset('assets/images/chatbotlogo.png')
            : Icon(Icons.person),
      ),
      SizedBox(
        width: 10,
      ),
      Expanded(
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: type == ChatMessageType.bot
                ? Color.fromARGB(255, 65, 20, 168)
                : Pallete.themeColor,
            borderRadius:
                BorderRadius.circular(10).copyWith(topLeft: Radius.zero),
          ),
          child: Text(
            "$chattext",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    ],
  );
}
