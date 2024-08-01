import 'package:flutter/material.dart';
import 'package:islami_10_am/core/widgets/bg_widget.dart';
import 'package:islami_10_am/modules/layout/screens/hadth_screen.dart';
import 'package:islami_10_am/modules/layout/screens/quran_screen.dart';
import 'package:islami_10_am/modules/layout/screens/radio_screen.dart';
import 'package:islami_10_am/modules/layout/screens/sebha_screen.dart';
import 'package:islami_10_am/modules/layout/screens/settings_screen.dart';

class LayoutScreen extends StatefulWidget {
  static const String routeName = "Layout";
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int selectedIndex = 0;
  List<Widget> screen = [
    QuranScreen(),
    HadethScreen(),
    SebhaScreen(),
    RadioScreen(),
    SettingsScreen()
  ];
  List<String> titles = [
    "Islami",
    "Hadeth",
    "Sebha",
    "Radio",
    "Settings",
  ];
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return BgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            titles[selectedIndex],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            selectedIndex = value;
            pageController.animateToPage(value,
                duration: const Duration(milliseconds: 600),
                curve: Curves.decelerate);
            setState(() {});
          },
          currentIndex: selectedIndex,
          items: const [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/icons/quran_icn.png")),
                label: "Quran"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/icons/hadeth.png")),
                label: "Hadeth"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/icons/sebha.png")),
                label: "Sebha"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/icons/radio.png")),
                label: "Radio"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Setteings"),
          ],
        ),
        body: PageView(
          controller: pageController,
          onPageChanged: (value) {
            selectedIndex = value;
            setState(() {});
          },
          children: screen,
        ),
      ),
    );
  }
}
