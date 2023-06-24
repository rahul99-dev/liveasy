import 'package:flutter/material.dart';
import 'package:language_picker/language_picker_dropdown.dart';
import 'package:language_picker/languages.dart';
import 'package:language_picker/languages.g.dart';
import 'package:liveasy/input_mobile.dart';

class LanguageSelector extends StatelessWidget {
  LanguageSelector({super.key});
  final supportedLanguages = [
    Languages.english,
    Languages.french,
    Languages.japanese,
    Languages.korean,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
            fit: BoxFit.contain,
            alignment: Alignment.bottomCenter,
            image: AssetImage('images/pattern.png'),
          ))),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage('images/image.png')),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Please Select your Language',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
                Text('You can change your language anytime'),
                Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  margin: EdgeInsets.only(
                      left: 60.0, right: 60, top: 20, bottom: 20),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LanguagePickerDropdown(
                        languages: supportedLanguages,
                        onValuePicked: (Language language) {
                          print(language.name);
                        }),
                  ),
                ),
                SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MobileNumber()));
                      },
                      child: Text(
                        'NEXT',
                        style: TextStyle(fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(46, 59, 98, 1.0)),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
