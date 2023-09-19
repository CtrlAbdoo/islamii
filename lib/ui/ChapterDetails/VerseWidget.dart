import 'package:flutter/material.dart';

class VerseWidget extends StatelessWidget {
  String content;
  int index;

  VerseWidget(this.content,this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8),
        child: Text('$content {${index+1}}',
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xFFFACC1D),
                fontSize: 20
            )
        )
    );
  }
}
