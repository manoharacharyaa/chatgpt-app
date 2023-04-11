import 'package:flutter/material.dart';
import 'package:sakecbot/dry/pallete.dart';
import 'package:url_launcher/url_launcher.dart';
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
          content(),
        ],
      ),
    );
  }

  Widget content() {
    final Uri url = Uri.parse("https://platform.openai.com/docs/api-reference");
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Pallete.themeColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: Text(
                "Learn More",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                launchUrl(url);
              },
            ),
          ],
        ),
      ),
    );
  }
}
