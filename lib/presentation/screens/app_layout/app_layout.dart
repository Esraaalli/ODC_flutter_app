import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import '../home/home_screen.dart';
import '../news/news_screen.dart';
import '../settings/settings_screen.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({Key? key}) : super(key: key);

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int currentIndex = 0;
  List<Widget> screens = <Widget>[
    const HomeScreen(),
    const NewsScreen(),
    const SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => currentIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              icon: const Icon(
                Icons.home,
              ),
              activeColor: Colors.deepOrange,
              textAlign: TextAlign.center,
              title: const Text('Home')),
          BottomNavyBarItem(
              icon: const Icon(
                Icons.book,
              ),
              activeColor: Colors.deepOrange,
              textAlign: TextAlign.center,
              title: const Text('News')),
          BottomNavyBarItem(
              icon: const Icon(
                Icons.settings,
              ),
              activeColor: Colors.deepOrange,
              textAlign: TextAlign.center,
              title: const Text('Settings'))
        ],
      ),
    );
  }
}
