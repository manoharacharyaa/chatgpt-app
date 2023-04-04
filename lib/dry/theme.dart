import 'package:flutter/material.dart';

class CustomeTheme extends StatelessWidget {
  const CustomeTheme ({required this.begning, required this.end});

  final begning;
  final end;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: begning,
          end: Alignment.centerRight,
          colors: [Color(0XFF24243e), Color(0XFF302b63)],
        ),
      ),
    );
  }
}
