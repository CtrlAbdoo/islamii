import 'package:flutter/material.dart';

class MyThemeData{

 static ThemeData darkTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Color(0xFFFACC1D),
        unselectedItemColor: Colors.white,
        selectedIconTheme: IconThemeData(
            size: 35
        )
    ),
    appBarTheme: AppBarTheme(
        toolbarHeight: 100,
        centerTitle: true,
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 30)),
    scaffoldBackgroundColor: Colors.transparent,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Color(0xFF141A2E),
      primary: Color(0xFF141A2E),
      secondary: Color(0xFFFACC1D),
      onPrimary: Color(0xFFF8F8F8),
      onSecondary: Color(0xFFFACC1D),
      onSurface: Color(0xFF141A2E)
    ),
   cardTheme: CardTheme(
       color: Color(0xFF141A2E)
   ),
    useMaterial3: true,
  );
 static ThemeData lightTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Color(0xFF242424),
        unselectedItemColor: Colors.white,
        selectedIconTheme: IconThemeData(
            size: 35
        )
    ),
    appBarTheme: AppBarTheme(
        toolbarHeight: 100,
        centerTitle: true,
        iconTheme: IconThemeData(
            color: Color(0xFF242424)
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 30)),
    scaffoldBackgroundColor: Colors.transparent,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Color(0xFFB7935F),
      primary: Color(0xFFB7935F),
      secondary: Color(0xFF242424),
      onPrimary: Color(0xFF242424),
      onSecondary: Color(0xFFB7935F),
      onSurface: Color(0xFFF8F8F8)
    ),
    cardTheme: CardTheme(
      color: Color(0xFFF8F8F8)
    ),
    useMaterial3: true,
  );
}