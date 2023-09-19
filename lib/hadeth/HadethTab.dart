import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/hadeth/Hadeth.dart';
import 'package:islami/hadeth/HadethTitleWidget.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  @override
  Widget build(BuildContext context) {
    if(allAhadeth.isEmpty)
      loadHadethFile();

    return Column(
      children: [
        Expanded(
            flex: 1,
            child: Image.asset('assets/images/hadeth_logo.png')),
        Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
                border: Border.symmetric(
                    horizontal:
                        BorderSide(color: Color(0xFFFACC1D), width: 2))),
            child: Text(
              'Hadeth',
              style: TextStyle(color: Color(0xFFF8F8F8), fontSize: 25),
            )),
        Expanded(
          flex: 3,
          child:
          allAhadeth.isEmpty? Center(child: CircularProgressIndicator(color: Color(0xFFFACC1D),))
          : ListView.separated(
              itemBuilder: (context, index) {
                return HadethTitleWidget(allAhadeth[index]);
              },
              separatorBuilder: (context, index) => Container(
                    color: Color(0xFFFACC1D),
                    width: double.infinity,
                    height: 2,
                    margin: EdgeInsets.symmetric(horizontal: 64),
                  ),
              itemCount: allAhadeth.length),
        )
      ],
    );
  }

  List<Hadeth> allAhadeth = [] ;

  void loadHadethFile() async {
    String fileContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> hadethList = fileContent.trim().split('#');
    for (String singleHadeth in hadethList) {
      List<String> HadethLines = singleHadeth.trim().split('\n');
      String title = HadethLines[0];
      HadethLines.remove(0);
      String content = HadethLines.join('\n');
      Hadeth hadeth = Hadeth(title, content);
      allAhadeth.add(hadeth);
    }
    setState(() {});
  }
}
