import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/hadeth/HadethTab.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:islami/quran/QuranTab.dart';
import 'package:islami/radio/RadioTab.dart';
import 'package:islami/sebha/SebhaTab.dart';
import 'package:islami/settings/SettingsTab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class home extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    My_Provider my_provider = Provider.of<My_Provider>(context);
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersiveSticky,
      overlays: [SystemUiOverlay.bottom],
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.islamiTitle, style: GoogleFonts.elMessiri(textStyle: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary)
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
              label: AppLocalizations.of(context)!.settings),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image(
            image: AssetImage(
                my_provider.getBackground()
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
