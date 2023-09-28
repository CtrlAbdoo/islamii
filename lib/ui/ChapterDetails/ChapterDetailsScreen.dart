import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:islami/ui/ChapterDetails/VerseWidget.dart';
import 'package:provider/provider.dart';

class ChapterDetailsScreen extends StatefulWidget {
  static const String routeName = 'ChapterDetailsScreen';

  @override
  State<ChapterDetailsScreen> createState() => _ChapterDetailsScreenState();
}

class _ChapterDetailsScreenState extends State<ChapterDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    My_Provider my_provider = Provider.of<My_Provider>(context);
    ChapterDetailsArgs args = ModalRoute.of(context)
    ?.settings.arguments as ChapterDetailsArgs;
    if(verses.isEmpty)
      loadFile(args.index);
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
            title: Text(args.title ,style:GoogleFonts.elMessiri (textStyle: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary
            )),),
          ),
          body: verses.isEmpty?
          Center(child: CircularProgressIndicator(color: Theme.of(context).colorScheme.secondary,))
              : Card(
                elevation: 18,
            //color: Theme.of(context).colorScheme.surface,
                margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18)

                ),
                child: ListView.builder(itemBuilder: (context, index) {
                  return VerseWidget(verses[index],index);
                },
                  itemCount: verses.length,
                  // separatorBuilder: (context, index) =>
                  //     Container(
                  //       color: Color(0xFFFACC1D),
                  //       width: double.infinity,
                  //       height: 2,
                  //       margin: EdgeInsets.symmetric(horizontal: 64),
                  //     ),
          ),
              )
        ));
  }

  List<String> verses =[];

  void loadFile(int index)async{
    String fileContent =
    await rootBundle.loadString(
        'assets/files/${index+1}.txt'
    );
    verses = fileContent.split('\n');
    setState(() {});
    print(fileContent);
  }
}

class ChapterDetailsArgs{
  String title;
  int index;

  ChapterDetailsArgs(this.title, this.index);
}
