import 'package:easy_localization/easy_localization.dart';
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
    "islami",
    "hadeth",
    "sebha",
    "radio",
    "settings",
  ];
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return BgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            titles[selectedIndex].tr(),
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
          items:  [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/icons/quran_icn.png")),
                label: "quran".tr()),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/icons/hadeth.png")),
                label: "hadeth".tr()),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/icons/sebha.png")),
                label: "sebha".tr()),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/icons/radio.png")),
                label: "radio".tr()),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "settings".tr()),
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
