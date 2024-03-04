import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami/models/radio_model.dart' as radio_model;
import 'package:islami/providers/my_provider.dart';
import 'package:islami/ui/radioWidget/radio_widget.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class RadioTab extends StatelessWidget {
  RadioTab({super.key});
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    My_Provider my_provider = Provider.of<My_Provider>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: Image.asset('assets/images/radio_image.png'),
        ),
        Expanded(
          child: FutureBuilder<radio_model.RadioModel>(
            future: apiData(my_provider),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AlertDialog(
                        title: Text("Error"),
                        content: Text("An error occurred. Please try again!"),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              // Handle the retry logic here
                            },
                            child: Text("Try Again"),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              radio_model.RadioModel radioModel = snapshot.data!;
              List<radio_model.RadioData> radioData = radioModel.radios!;
              return ListView.builder(
                physics: PageScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: radioData.length,
                itemBuilder: (context, index) {
                  return RadioWidget(radioData: radioData[index],player: player,);
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Future<radio_model.RadioModel> apiData(My_Provider my_provider) async {
    var lang = my_provider.currentLocale;
    if(lang == 'en'){
      lang = 'eng';
    }
    var url = Uri.parse('https://mp3quran.net/api/v3/radios?language=$lang');
    http.Response apiResponse = await http.get(url);
    var json = jsonDecode(apiResponse.body);
    radio_model.RadioModel model = radio_model.RadioModel.fromJson(json);
    return model;
  }
}
