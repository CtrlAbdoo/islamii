import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/models/radio_model.dart' as radio_model;
import 'package:audioplayers/audioplayers.dart';

class RadioWidget extends StatefulWidget {
  RadioWidget({required this.radioData,required this.player});

  final radio_model.RadioData radioData;
  AudioPlayer player;

  @override
  _RadioWidgetState createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            textAlign: TextAlign.center,
            widget.radioData.name!,
            style: GoogleFonts.elMessiri(
              textStyle: TextStyle(fontSize: 25),
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                isPlaying = !isPlaying;
                // Add logic to play or pause audio here
                // You can use the 'isPlaying' variable to determine the icon
                isPlaying?
                widget.player.play(UrlSource(widget.radioData.url!)):
                    widget.player.pause();
              });
            },
            icon: Icon(
              isPlaying ? Icons.pause : Icons.play_arrow,
              size: 60,
            ),
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ],
      ),
    );
  }
}
