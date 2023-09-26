import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami/ChapterDetails/ChapterDetailsScreen.dart';
import 'package:islami/home.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
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
          onPrimary: Colors.white,
          onSecondary: Colors.black,
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        home.routeName: (_) => home(),
        ChapterDetailsScreen.routeName: (_) => ChapterDetailsScreen(),
        //'sebha':(_)=> SebhaScreen()
      },
      initialRoute: home.routeName,

      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],

      locale: Locale('ar'),
    );
  }
}
