import 'package:flutter/material.dart';

class ChatTheme extends StatelessWidget {
  const ChatTheme(
      {required this.begning,
      required this.end,
      this.radius,
      this.margin,
      this.padding,
      required this.chatBubble});

  final begning;
  final end;
  final radius;
  final margin;
  final padding;
  final chatBubble;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: begning,
          end: end,
          colors: [Color(0XFF24243e), Color(0XFF302b63)],
        ),
        borderRadius: radius,
      ),
      child: chatBubble,
    );
  }
}
