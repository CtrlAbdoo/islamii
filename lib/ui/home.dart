import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/hadeth/HadethTab.dart';
import 'package:islami/quran/QuranTab.dart';
import 'package:islami/radio/RadioTab.dart';
import 'package:islami/sebha/SebhaTab.dart';
import 'package:islami/settings/SettingsTab.dart';
import 'package:islami/ui/MyThemeDat.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class home extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersiveSticky,
      overlays: [SystemUiOverlay.bottom],
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.islamiTitle, style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary
        ),),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){

          setState(() {
            selectedTabIndex = index;
          });
        },
        currentIndex: selectedTabIndex,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: ImageIcon(AssetImage('assets/images/iconquran.png')),
              label: AppLocalizations.of(context)!.quran),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: ImageIcon(AssetImage('assets/images/icon_hadeth@3x.png')),
              label: AppLocalizations.of(context)!.hadeth),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: ImageIcon(AssetImage('assets/images/icon_sebha@3x.png')),
              label: AppLocalizations.of(context)!.sebha),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: ImageIcon(AssetImage('assets/images/icon_radio@3x.png')),
              label: AppLocalizations.of(context)!.radio),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.settings),
              label: AppLocalizations.of(context)!.setting),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image(
            image: AssetImage(
                MyThemeData.isDarkEnabled?
                'assets/images/bg.jpg':
                'assets/images/bg3.jpg'
            ),
            fit: BoxFit.fill,
          ),
          Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Expanded(child: tabs[selectedTabIndex]),
            ],
          ),
        ],
      ),
    );

  }
  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    SettingsTab(),
  ];
}
