import 'package:flutter/material.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:islami/ui/ChapterDetails/ChapterDetailsScreen.dart';
import 'package:islami/ui/MyThemeDat.dart';
import 'package:islami/ui/hadethDetalies/hadethDetailesScreen.dart';
import 'package:islami/ui/home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (buildContext)=>My_Provider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    My_Provider my_provider = Provider.of<My_Provider>(context);

    return MaterialApp(


      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: my_provider.currentTheme,


      debugShowCheckedModeBanner: false,
      routes: {
        home.routeName: (_) => home(),
        ChapterDetailsScreen.routeName: (_) => ChapterDetailsScreen(),
        hadethDetailesScreen.routeName: (_) => hadethDetailesScreen(),
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

      locale: Locale(my_provider.currentLocale),
    );
  }
}
