import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/hadeth/Hadeth.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:islami/ui/MyThemeDat.dart';
import 'package:provider/provider.dart';

class hadethDetailesScreen extends StatelessWidget {
  static const routeName = 'hadethDetailesScreen';
  @override
  Widget build(BuildContext context) {
    My_Provider my_provider = Provider.of<My_Provider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              my_provider.getBackground(),
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
            appBar: AppBar(
              title: Text(args.title, style: GoogleFonts.elMessiri(textStyle: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary)
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
                          style: GoogleFonts.elMessiri(textStyle: TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: 20))),
                    ),
                  ),
                ),
              ],
            )));
  }
}
