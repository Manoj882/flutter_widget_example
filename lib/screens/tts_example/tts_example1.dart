import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TTSEXample1 extends StatefulWidget {
  const TTSEXample1({super.key});

  @override
  State<TTSEXample1> createState() => _TTSEXample1State();
}

class _TTSEXample1State extends State<TTSEXample1> {
  final _controller = TextEditingController();

  FlutterTts _flutterTts = FlutterTts();

  List<String> _spokenWords = [];

  


  @override
  void initState() {
    super.initState();
    _controller.text = "Hello I am Manoj BK. I am from kapan. I am flutter developer. I am working at mypay office.";

    _flutterTts.setProgressHandler((text, start, end, word) {
      print('text >>> $start-$end >>>>> $text');
      setState(() {
        _spokenWords.add(word);
      });

     });
  }


  void speak() async {
    _spokenWords.clear();
    await _flutterTts.speak(_controller.text);
  }

  @override
  void dispose() {
      _controller.dispose();
      _flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TTS Example'),),



      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(controller: _controller,),
        
            const SizedBox(height: 50,),
        
            ElevatedButton(onPressed: (){
              speak();
        
            }, child: const  Icon(Icons.volume_up_outlined),),


            const SizedBox(height: 20),
            const Text('Spoken Words:'),
            Expanded(
              child: ListView.builder(
                itemCount: _spokenWords.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_spokenWords[index]),
                  );
                },
              ),
            ),
        
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(onPressed: (){
        // _flutterTts.stop();
        _flutterTts.pause();
      }, child: Icon(Icons.stop_outlined),),
    );
  }
}


/// region - new code


// import 'package:flutter/material.dart';
// import 'package:flutter_tts/flutter_tts.dart';

// class TTSEXample1 extends StatefulWidget {
//   const TTSEXample1({super.key});

//   @override
//   State<TTSEXample1> createState() => _TTSEXample1State();
// }

// class _TTSEXample1State extends State<TTSEXample1> {
//   final _controller = TextEditingController();
//   final FlutterTts _flutterTts = FlutterTts();

//   List<String> _spokenWords = [];
//   List<String> _wordsToSpeak = []; // Words split from the text
//   int _currentWordIndex = 0; // Track the current word index

//   @override
//   void initState() {
//     super.initState();
//     _controller.text =
//         "Hello I'm Manoj BK. I'm from Kapan. I'll be a doctor. I am a Flutter developer. I am working at MyPay office.";

//     _flutterTts.setCompletionHandler(() {
//       setState(() {
//         if (_currentWordIndex < _wordsToSpeak.length) {
//           _speakNextWord();
//         }
//       });
//     });
//   }

//   void _prepareText() {
//     // Split text into words and reset indices
//     setState(() {
//       _spokenWords.clear();
//       _wordsToSpeak = _controller.text.split(' ');
//       _currentWordIndex = 0;
//     });
//   }

//   void _speakNextWord() async {
//     if (_currentWordIndex < _wordsToSpeak.length) {
//       String word = _wordsToSpeak[_currentWordIndex];
//       await _flutterTts.speak(word);
//       setState(() {
//         _spokenWords.add(word);
//         _currentWordIndex++;
//       });
//     }
//   }

//   void play() {
//     if (_wordsToSpeak.isEmpty) {
//       _prepareText();
//     }
//     _speakNextWord();
//   }

//   void pause() {
//     _flutterTts.stop();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     _flutterTts.stop();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('TTS Example'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextFormField(
//               controller: _controller,
//             ),
//             const SizedBox(height: 50),
//             ElevatedButton(
//               onPressed: play,
//               child: const Icon(Icons.volume_up_outlined),
//             ),
//             const SizedBox(height: 20),
//             const Text('Spoken Words:'),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _spokenWords.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(_spokenWords[index]),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: pause,
//         child: const Icon(Icons.pause_outlined),
//       ),
//     );
//   }
// }
