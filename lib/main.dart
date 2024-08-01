import 'package:flutter/material.dart';
import 'package:islami_10_am/core/theme/app_theme.dart';
import 'package:islami_10_am/modules/layout/layout_screen.dart';
import 'package:islami_10_am/modules/splash/screens/spalsh_screen.dart';

import 'modules/layout/hadeth/hadeth_details.dart';
import 'modules/quran/quran_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      routes: {
        LayoutScreen.routeName: (context) => const LayoutScreen(),
        SplashScreen.routeName: (context) => const SplashScreen(),
        QuranDetails.routeName: (context) => QuranDetails(),
        HadethDetails.routeName: (context) => HadethDetails(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
