import 'package:flutter/material.dart';
import '../dry/pallete.dart';

class NavTile extends StatelessWidget {
  const NavTile({
    super.key,
    required this.text,
    required this.icon,
    this.navigation,
    this.onclick,
  });

  final text;
  final icon;
  final navigation;
  final onclick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: ListTile(
        leading: icon,
        title: text,
        tileColor: Pallete.themeColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(11)),
        ),
        onTap: () async {
          Navigator.pushNamed(context, navigation);
        },
      ),
    );
  }
}
