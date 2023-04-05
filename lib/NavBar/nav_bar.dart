import 'package:flutter/material.dart';
import 'package:sakecbot/dry/pallete.dart';
import 'nav_tile.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Pallete.navBarColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Pallete.themeColor,
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/menubanner.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
            accountName: Text('Chat-Bot'),
            accountEmail: Text('example@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/images/chatbotlogo.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          NavTile(
            text: Text(
              'Home',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            navigation: '/second',
          ),
          NavTile(
            text: Text(
              'AI Chat',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            icon: Icon(
              Icons.chat,
              color: Colors.white,
            ),
            navigation: '/chatscreen',
          ),
          NavTile(
            text: Text(
              'Share',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            icon: Icon(
              Icons.share,
              color: Colors.white,
            ),
            navigation: '/first',
          ),
          NavTile(
            text: Text(
              'About this app',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            icon: Icon(
              Icons.info,
              color: Colors.white,
            ),
            navigation: '/first',
          ),
        ],
      ),
    );
  }
}
