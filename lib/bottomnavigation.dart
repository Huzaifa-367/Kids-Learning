import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kids_learning_app/privacypolicy.dart';
import 'package:kids_learning_app/setting.dart';
import 'package:kids_learning_app/homeScreen.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _selectedIndex = 1;

  static final List<Widget> _pages = <Widget>[
    const Setting(),
    const HomeScreen(),
    PrivacyPolicy(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 32,
        selectedItemColor: const Color(0xFFF19335),
        selectedIconTheme: const IconThemeData(color: Color(0xFFF19335)),
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
                AssetImage("assets/images/12Icon feather-settings.png")),
            label: 'Setting',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/12Group 1.png")),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/privacy.png")),
            label: 'Privacy',
          ),
        ],
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
    );
  }
}
