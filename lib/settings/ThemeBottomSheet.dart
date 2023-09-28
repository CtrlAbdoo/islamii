import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var my_provider = Provider.of<My_Provider>(context);
    return Container(
      color: Theme.of(context).colorScheme.onSurface,
      // width: double.infinity,
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
              onTap: () {
                my_provider.changeTheme(ThemeMode.light);
              },
              child: my_provider.isDarkEnabled()
                  ? getUnSelectedItem(AppLocalizations.of(context)!.light)
                  : getSelectedItem(AppLocalizations.of(context)!.light)),
          InkWell(
              onTap: () {
                my_provider.changeTheme(ThemeMode.dark);
              },
              child: my_provider.isDarkEnabled()
                  ? getSelectedItem(AppLocalizations.of(context)!.dark)
                  : getUnSelectedItem(AppLocalizations.of(context)!.dark))
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
                  color: Theme.of(context).colorScheme.onSecondary, fontSize: 24),
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
