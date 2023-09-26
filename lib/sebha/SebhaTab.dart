import 'package:flutter/material.dart';
import 'package:islami/ui/MyThemeDat.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  List<String> tesbih = ['سبحان الله ', 'الحمد لله', 'الله أكبر'];

  int numSebha = 0;

  int count = 1 ;

  String nameSebha = 'سبحان الله';

  double _rotationAngle = 0.0;

  void _rotateImage() {
    setState(() {
      _rotationAngle -= 45.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(
                  left: 50,
                ),
                child: Image.asset(
                    MyThemeData.isDarkEnabled?
                    'assets/images/head_sebha_dark.png':
                    'assets/images/head_sebha.png'
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 80,
              ),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    _rotateImage();
                    addTesbih(count);
                  },
                  child: Transform.rotate(
                    angle: _rotationAngle * (3.14159265359 / 180),
                    child: Image.asset(
                        MyThemeData.isDarkEnabled?
                        'assets/images/body_sebha_dark.png':
                        'assets/images/body_sebha.png'
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Text(AppLocalizations.of(context)!.sebha_counter,style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
          fontSize: 25
        ),),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 80,
          width: 70,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(25)),
          child:
          Text('$numSebha',style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 25
          ),),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 50,
          width: 130,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSecondary,
              borderRadius: BorderRadius.circular(25)),
          child:
          Text('$nameSebha',style: TextStyle(fontSize: 25),),
        ),
      ],
    );
  }

  void addTesbih(index) {

    if (numSebha == 33) {
      nameSebha = tesbih[index];
      numSebha = 0;
      count++ ;
    }
    if(nameSebha == 'الله أكبر') {
      count = 0 ;
    }
    setState(() {
      numSebha++;
    });

  }
}

