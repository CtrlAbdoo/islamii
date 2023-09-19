import 'package:flutter/material.dart';
import 'package:islami/hadeth/Hadeth.dart';

class hadethDetailesScreen extends StatelessWidget {
  static const routeName = 'hadethDetailesScreen';
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
    return Container(
        decoration: const BoxDecoration(
            image:
                DecorationImage(image: AssetImage('assets/images/darkbg.png'))),
        child: Scaffold(
            appBar: AppBar(
              title: Text(args.title),
            ),
            body: Column(
              children: [
                Expanded(
                  child: Card(
                    elevation: 18,
                    color: Color(0xFF141A2E),
                    margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                    child: SingleChildScrollView(
                      child: Text(args.content,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Color(0xFFFACC1D), fontSize: 20)),
                    ),
                  ),
                ),
              ],
            )));
  }
}
