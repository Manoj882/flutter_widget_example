import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter_widget_example/main.dart';
import 'package:flutter_widget_example/screens/tts_example/tts_example2.dart';

class TTSExample3 extends StatefulWidget {
  const TTSExample3({super.key});

  @override
  State<TTSExample3> createState() => _TTSExample3State();
}

class _TTSExample3State extends State<TTSExample3> {
  List<Word> targetWord = [];
  final FlutterTts _flutterTts = FlutterTts();

  List<String> words = [];

  Map<int, Word> adjHightLightWords = {};

  Map<int, Word> adjNounWords = {};


  int _currentSpokenIndex = 0;


  @override
  void initState() {
    super.initState();
    flutterTTSSetup();

    targetWord = lessonModel?.words ?? [];
    words = lessonModel?.lessonText.split(' ') ?? [];

    //print('total target word: ${targetWord.length}');

  

    _flutterTts.setProgressHandler((text, start, end, spokenWord) {

      
      _currentSpokenIndex++;
    
      setState(() {
         targetWord.any((w) {
          print('hello word: ${w.pos} >>>> $spokenWord >>>> $_currentSpokenIndex');

          if( (_currentSpokenIndex >= w.pos) && words[w.pos].contains(spokenWord)) {
            if(w.type == "adj"){
              adjHightLightWords.addAll({w.pos: w});
            } else if(w.type == 'noun'){
              adjNounWords.addAll({w.pos: w});
            }
            
             targetWord.removeWhere((removeElement) => removeElement.pos == w.pos);

            return true;
          }
          return false;
        });

      
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _flutterTts.stop();
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
      bool isNounMatched = false;

      String highlightSubString = '';

      if (adjHightLightWords.containsKey(index) && (_currentSpokenIndex >= index)) {
        isAdjMatched = true;

        highlightSubString = adjHightLightWords[index]?.value ?? "";
      }
      if (adjNounWords.containsKey(index) && (_currentSpokenIndex >= index)) {
        isNounMatched = true;

        highlightSubString = adjNounWords[index]?.value ?? "";
      }
      final startIndex = word.indexOf(highlightSubString);

      if (startIndex != -1 && (isAdjMatched || isNounMatched)) {
        final before = word.substring(0, startIndex);
        final match =
            word.substring(startIndex, startIndex + highlightSubString.length);
        final after = word.substring(startIndex + highlightSubString.length);

        return TextSpan(
          children: [
            TextSpan(
              text: before,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
            ),
            TextSpan(
              text: match,
              style: TextStyle(
                  color: (isAdjMatched)
                      ? Colors.orange
                      : (isNounMatched)
                          ? Colors.yellow
                          : Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: after,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
            ),
            const TextSpan(text: ' '),
          ],
        );
      } else {
        return TextSpan(
          text: '$word ',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
        );
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    //  print('hello adj hightligt worrd: $adjHightLightWords');

    //print('hello target words: $targetWord');

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: RichText(
                text: TextSpan(
                  children: _buildTextSpans(),
                  style: const TextStyle(fontSize: 16), // Default text style
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
