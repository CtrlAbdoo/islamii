import 'package:flutter/material.dart';
import 'package:islami/hadeth/Hadeth.dart';
import 'package:islami/ui/MyThemeDat.dart';

class hadethDetailesScreen extends StatelessWidget {
  static const routeName = 'hadethDetailesScreen';
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
    return Container(
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(MyThemeData.isDarkEnabled?
                'assets/images/bg.jpg':
                'assets/images/bg3.jpg'))),
        child: Scaffold(
            appBar: AppBar(
              title: Text(args.title, style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary
            ),),
            ),
            body: Column(
              children: [
                Expanded(
                  child: Card(
                    elevation: 18,
                    //color: Theme.of(context).colorScheme.surface,
                    margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                    child: SingleChildScrollView(
                      child: Text(args.content,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: 20)),
                    ),
                  ),
                ),
              ],
            )));
  }
}
