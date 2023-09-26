import 'package:flutter/material.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.onSurface,
      // width: double.infinity,
       padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getSelectedItem('Dark'),
          getUnSelectedItem('Light')
        ],
      ),
    );
  }

  Widget getSelectedItem(String txt){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(txt, style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondary,
            fontSize: 24
        ),),
        Icon(Icons.check,
          color: Theme.of(context).colorScheme.onSecondary,)
      ],
    );
  }

  Widget getUnSelectedItem(String txt){
    return Text(txt, style: TextStyle(
        color: Theme.of(context).colorScheme.onPrimary,
        fontSize: 24
    ),);
  }
}
