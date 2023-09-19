import 'package:flutter/material.dart';
import 'package:islami/hadeth/Hadeth.dart';
import 'package:islami/ui/hadethDetalies/hadethDetailesScreen.dart';

class HadethTitleWidget extends StatelessWidget {
    Hadeth hadeth;

  HadethTitleWidget(this.hadeth);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context)
            .pushNamed(hadethDetailesScreen.routeName,
        arguments: hadeth
        );
      },
      child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(8),
          child: Text(hadeth.title,
              style: TextStyle(color: Color(0xFFF8F8F8),
                  fontSize: 25
              )
          )
      ),
    );
  }
}
