import 'package:flutter/material.dart';
import 'package:islami/settings/ThemeBottomSheet.dart';
import 'package:islami/settings/languageBottomSheet.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 64,
        horizontal: 18
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Theme',style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary
          ),),
          InkWell(
            onTap: (){
              showThemeBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.onSecondary,
                    width: 1
                  )
                ),
                child: Text('Dark',style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 18
                ),)
            ),
          ),
          SizedBox(height: 18,),
          Text('Languadge',style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary
          ),),
          InkWell(
            onTap: (){
              showLanguageBottomSheet();
            },
            child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        color: Theme.of(context).colorScheme.onSecondary,
                        width: 1
                    )
                ),
                child: Text('English',style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 18
                ),)
            ),
          )
        ],
      ),
    );
  }



  void showLanguageBottomSheet() {
    showModalBottomSheet(context: context,
        builder: (context) {
          return languageBottomSheet();
        },
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(context: context,
        builder: (context) {
          return ThemeBottomSheet();
        },
    );
  }
}
