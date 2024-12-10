

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter_widget_example/main.dart';
import 'package:flutter_widget_example/screens/tts_example/tts_example2.dart';

class TTSExample4 extends StatefulWidget {
  const TTSExample4({super.key});

  @override
  State<TTSExample4> createState() => _TTSExample4State();
}

class _TTSExample4State extends State<TTSExample4> {
   List<Word> adjWords = [];
  final FlutterTts _flutterTts = FlutterTts();

  List<String> words = [];


Map<int, Word> adjHightLightWords = {};

List<Map<int, String>> adjHightLightText = [];


int _tempStartOffset = 0;
int _tempEndOffset = 0;

  @override
  void initState() {
    super.initState();
    flutterTTSSetup();

    adjWords = lessonModel?.words ?? [];

  
    words = lessonModel?.lessonText.split(' ') ?? [];  
    

       _flutterTts.setProgressHandler((text, startOffset, endOffset, spokenWord) {

        if(_tempStartOffset == 0){
          if(_tempStartOffset == 0 && (startOffset == 0)){
            _tempStartOffset = startOffset;
            
          _tempEndOffset = endOffset;

          } else {
            _tempStartOffset = _tempEndOffset + 1;
            _tempEndOffset = _tempEndOffset + (endOffset-_tempEndOffset);
          }
          
        } else {
          if(startOffset != 0){
            _tempStartOffset = _tempEndOffset + 1;
            _tempEndOffset = _tempEndOffset + (endOffset-startOffset) + 1;
          } else {
            _tempStartOffset = _tempEndOffset+1;
             _tempEndOffset = _tempEndOffset + (endOffset-startOffset);
          }
        }


      //     if (_tempStartOffset != 0 && startOffset == 0) {
      //   _tempStartOffset = _tempEndOffset + 1;
      //   _tempEndOffset = _tempEndOffset + (endOffset - startOffset) + 1;
      // } else {
      //   _tempStartOffset = startOffset;
      //   _tempEndOffset += (endOffset - startOffset);
      // }


      print("tts >>>> $startOffset-$endOffset <----> $spokenWord");
      print("temp >>>> $_tempStartOffset-$_tempEndOffset <----> $spokenWord");
      print(" ");

        

      
      
        
      
      });

  }

@override
void dispose(){
  super.dispose();
  _flutterTts.stop();
  _tempStartOffset = 0;
  _tempEndOffset = 0;
}

    flutterTTSSetup() async {
    await _flutterTts.setLanguage("fr-FR");
    await _flutterTts.setSpeechRate(0.45);
    await _flutterTts.setVolume(1.0);
    await _flutterTts.setPitch(1.0);
    await _flutterTts.setVoice({"name": "Thomas", "locale": "fr-FR"});

    }

  

  // Function to style the text dynamically
  List<TextSpan> _buildTextSpans() {
    return words.asMap().entries.map((entry) {
      final index = entry.key;
      final word = entry.value;

      bool isAdjMatched = false;
  

      if(adjHightLightWords.containsKey(index)){
        setState(() {
          isAdjMatched = true;
        });
      }


      //print('hello adj hightlist words: $adjHightLightWords');

     

      return TextSpan(
        text: '$word ', 
        style: TextStyle(
          fontWeight: isAdjMatched ? FontWeight.bold : FontWeight.normal,
          color: isAdjMatched ? Colors.blue : Colors.black,
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
   
   
    return Scaffold(
      appBar: AppBar(
        title: const Text('TTS Example with Highlight'),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              onPressed: () {
                _flutterTts.speak(lessonModel?.lessonText ?? "");
              },
              child: const Icon(Icons.play_circle),
            ),
             FloatingActionButton(
              onPressed: () {
                _flutterTts.pause();
              },
              child: const Icon(Icons.pause_circle),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: RichText(
          text: TextSpan(
            children: _buildTextSpans(),
            style: const TextStyle(fontSize: 16), // Default text style
          ),
        ),
      ),
    );
  }
}



// Mocked global variable (Replace with actual
