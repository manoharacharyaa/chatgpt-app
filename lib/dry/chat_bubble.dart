import 'package:flutter/material.dart';
import 'package:sakecbot/dry/chat_model.dart';
import 'package:sakecbot/pallete.dart';

Widget chatBubble({required chattext, required ChatMessageType type}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CircleAvatar(
        backgroundColor: Pallete.themeColor,
        child: Icon(Icons.person),
      ),
      SizedBox(
        width: 10,
      ),
      Expanded(
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            color: Pallete.themeColor,
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
