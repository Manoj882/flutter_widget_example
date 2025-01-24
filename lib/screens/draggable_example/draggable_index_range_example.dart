import 'package:flutter/material.dart';

// class DragAndDropIndexRangeExample extends StatefulWidget {
//   @override
//   _DragAndDropIndexRangeExampleState createState() => _DragAndDropIndexRangeExampleState();
// }

// class _DragAndDropIndexRangeExampleState extends State<DragAndDropIndexRangeExample> {
//   String sentence =
//       "Ce jour-là le facteur Boniface, en sortant de la maison de poste, constata que sa tournée serait moins longue que de coutume, et il en ressentit une joie vive.";
//   List<int> range = [17, 18, 19];
//   String draggableWord = "moins longue que";
//   bool isDropped = false;

//   @override
//   Widget build(BuildContext context) {
//     // Split the sentence into words
//     List<String> words = sentence.split(" ");
    
//     // Corrected slicing of the sentence
//     String before = words.sublist(0, range[0]).join(" ");
//     String after = words.sublist(range[2] + 1).join(" ");

//     return Scaffold(
//       appBar: AppBar(title: Text("Drag and Drop Sentence")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Table(
//           children: [
//             TableRow(
//               children: [
//                 // Left TableCell: Sentence with placeholder
//                 DragTarget<String>(
//                   builder: (context, candidateData, rejectedData) {
//                     return RichText(
//                       text: TextSpan(
//                         style: TextStyle(color: Colors.black, fontSize: 16),
//                         children: [
//                           TextSpan(text: before + " "),
//                           TextSpan(
//                             text: isDropped ? draggableWord : "___",
//                             style: TextStyle(
//                               color: Colors.blue,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           TextSpan(text: " " + after),
//                         ],
//                       ),
//                     );
//                   },
//                   onAccept: (data) {
//                     if (data == draggableWord) {
//                       setState(() {
//                         isDropped = true;
//                       });
//                     }
//                   },
//                 ),
//                 // Right TableCell: Draggable word
//                 Draggable<String>(
//                   data: draggableWord,
//                   feedback: Material(
//                     color: Colors.transparent,
//                     child: Text(
//                       draggableWord,
//                       style: TextStyle(
//                         color: Colors.blue,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                   childWhenDragging: Container(),
//                   child: Text(
//                     draggableWord,
//                     style: TextStyle(
//                       color: Colors.blue,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }













class DragAndDropIndexRangeExample extends StatefulWidget {
  @override
  _DragAndDropIndexRangeExampleState createState() => _DragAndDropIndexRangeExampleState();
}

class _DragAndDropIndexRangeExampleState extends State<DragAndDropIndexRangeExample> {
  final List<dynamic> sentence = [
    "I",
    "love",
    "nepal",
    ["I", "want", "nepal"],
    "I",
    "like",
    "nepal"
  ];

  final List<String> draggedWords = []; // Stores words placed in DragTarget.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sentence Builder"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children: _buildSentenceWidgets(),
        ),
      ),
    );
  }

  List<Widget> _buildSentenceWidgets() {
    List<Widget> widgets = [];

    for (var item in sentence) {
      if (item is String) {
        // Regular word, add as plain Text
        widgets.add(Text(
          item,
          style: TextStyle(fontSize: 16),
        ));
      } else if (item is List) {
        // Nested list, add draggable items inline
        for (var word in item) {
          widgets.add(Draggable<String>(
            data: word,
            feedback: Material(
              child: Text(
                word,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  backgroundColor: Colors.blue,
                ),
              ),
            ),
            childWhenDragging: Opacity(
              opacity: 0.5,
              child: Text(
                word,
                style: TextStyle(fontSize: 16),
              ),
            ),
            child: ColoredBox(
              color: Colors.redAccent,
              child: DragTarget<String>(
                onAccept: (data) {
                  setState(() {
                    draggedWords.add(data);
                  });
                },
                builder: (context, candidateData, rejectedData) {
                  return Text(
                    word,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight:
                            draggedWords.contains(word) ? FontWeight.bold : null,
                        decoration: candidateData.isNotEmpty
                            ? TextDecoration.underline
                            : null),
                  );
                },
              ),
            ),
          ));
        }
      }
    }

    return widgets;
  }
}
