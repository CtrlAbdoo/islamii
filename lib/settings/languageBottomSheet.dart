import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:provider/provider.dart';

class languageBottomSheet extends StatefulWidget {
  @override
  State<languageBottomSheet> createState() => _languageBottomSheetState();
}

class _languageBottomSheetState extends State<languageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var my_provider = Provider.of<My_Provider>(context);
    return Container(
      color: Theme.of(context).colorScheme.onSurface,
      // width: double.infinity,
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {
                my_provider.changeLocale('en');
              },
              child: my_provider.isEnglishEnabled()
                  ? getSelectedItem('English')
                  : getUnSelectedItem('English')),
          InkWell(
              onTap: () {
                my_provider.changeLocale('ar');
              },
              child: my_provider.isEnglishEnabled()
                  ? getUnSelectedItem('العربيه')
                  : getSelectedItem('العربيه'))
        ],
      ),
    );
  }

  Widget getSelectedItem(String txt) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              txt,
              style: GoogleFonts.elMessiri(textStyle: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                  fontSize: 24),
            )),
          ],
        ),
        Icon(
          Icons.check,
          color: Theme.of(context).colorScheme.onSecondary,
        )
      ],
    );
  }

  Widget getUnSelectedItem(String txt) {
    return Row(
      children: [
        Text(
          txt,
          style: GoogleFonts.elMessiri(textStyle: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary, fontSize: 24),
        )),
      ],
    );
  }
}
