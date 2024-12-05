import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter_widget_example/main.dart';
import 'package:pinput/pinput.dart';

class TTSExample2 extends StatefulWidget {
  const TTSExample2({super.key});

  @override
  State<TTSExample2> createState() => _TTSExample2State();
}

class _TTSExample2State extends State<TTSExample2> {
  late List<Word> adjWords;
  final FlutterTts _flutterTts = FlutterTts();

  List<String> words = [];


List<int> adjHightLightWords = [];

  @override
  void initState() {
    super.initState();

    // Initialize adjective words and split text
    adjWords = lessonModel?.words ?? [];
    words = lessonModel?.lessonText.split(' ') ?? [];  // Splits the lesson text into individual words


    

       _flutterTts.setProgressHandler((text, start, end, spokenWord) {
        bool isAdjective = false;
      
        setState(() {
          isAdjective = adjWords.any((w) {
            // print('hey word: ${words[w.pos]}');
            // print('hey spoken word: $spokenWord');
            // print("*************");
            if (words[w.pos] == spokenWord) {
              print(
                  'word1: ${words[w.pos]} >>>>> $spokenWord >>> index: ${w.pos}');
                  adjHightLightWords.add(w.pos);
              return true;
            }
            return false;
          });
         
        });
      
      });

  }

@override
void dispose(){
  super.dispose();
}
  

  // Function to style the text dynamically
  List<TextSpan> _buildTextSpans() {
    return words.asMap().entries.map((entry) {
      final index = entry.key;
      final word = entry.value;

      bool isAdjMatched = false;
  

      if(adjHightLightWords.contains(index)){
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
    print('hello adj words: $adjHightLightWords');
   
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

// Lesson and Word classes remain unchanged
class Lesson {
  final String lessonText;
  final List<Word> words;

  Lesson({
    required this.lessonText,
    required this.words,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      lessonText: json['lessionText'] as String,
      words: (json['word'] as List<dynamic>)
          .map((wordJson) => Word.fromJson(wordJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lessionText': lessonText,
      'word': words.map((word) => word.toJson()).toList(),
    };
  }
}

class Word {
  final int pos;
  final String type;

  Word({
    required this.pos,
    required this.type,
  });

  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
      pos: json['pos'] as int,
      type: json['type'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pos': pos,
      'type': type,
    };
  }
}

// Mocked global variable (Replace with actual
