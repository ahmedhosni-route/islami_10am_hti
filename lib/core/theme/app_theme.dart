import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static Color primaryLightColor = const Color(0xffB7935F);
  static Color primaryDarkColor = const Color(0xff141A2E);
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    fontFamily: GoogleFonts.elMessiri().fontFamily,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: GoogleFonts.elMessiri(
            fontSize: 30, color: const Color(0xff242424))),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: primaryLightColor,
      selectedItemColor: const Color(0xff242424),
      showUnselectedLabels: false,
      unselectedItemColor: Colors.white,
    ),
    dividerTheme: DividerThemeData(color: primaryLightColor, thickness: 3),
    textTheme: const TextTheme(
        bodySmall: TextStyle(
          fontSize: 12,
          color: Colors.black,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
        bodyLarge: TextStyle(
          fontSize: 20,
          color: Colors.black,
        )),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    fontFamily: GoogleFonts.elMessiri().fontFamily,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle:
          GoogleFonts.elMessiri(fontSize: 30, color: const Color(0xff242424)),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: primaryDarkColor,
      selectedItemColor: const Color(0xffFACC1D),
      showUnselectedLabels: false,
      unselectedItemColor: Colors.white,
    ),
    dividerTheme: DividerThemeData(color: primaryDarkColor, thickness: 3),
    textTheme: const TextTheme(
        bodySmall: TextStyle(
          fontSize: 12,
          color: Colors.white,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
        bodyLarge: TextStyle(
          fontSize: 20,
          color: Colors.white,
        )),
  );
}
