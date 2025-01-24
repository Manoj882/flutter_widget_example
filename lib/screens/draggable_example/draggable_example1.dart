// import 'package:flutter/material.dart';




// class DragAndDropPage extends StatefulWidget {
//   const DragAndDropPage({super.key});

//   @override
//   State<DragAndDropPage> createState() => _DragAndDropPageState();
// }

// class _DragAndDropPageState extends State<DragAndDropPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Drag and Drop Example"),),

//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Table(
//                columnWidths: const {
//                 0: FlexColumnWidth(),
//                 1: FixedColumnWidth(100.0),
//               },
//               border: TableBorder.all(),
//               children: [
//                 TableRow(
//                   children: [
//                     TableCell(child: Text("Bronze le muet avait l'oreille. Bien qu'il se trouvât à l'intérieur de la maison, il entendit distinctement tout ce que les haut-parleurs transmirent. Le soir, il sortit avant d'avoir terminé repas et emmena le buffle avec lui.")),
//                     TableCell(child: Column(
//                       children: [
//                         Text("fine"),
//                         Text('son'),
//                       ],
//                     ),),
//                   ],
                  
//                 ),
//               ],

//             ),
//           ],
        
//         ),
//       ),
//     );
//   }
// }






import 'package:flutter/material.dart';


class DragAndDropTable extends StatefulWidget {
  @override
  _DragAndDropTableState createState() => _DragAndDropTableState();
}

class _DragAndDropTableState extends State<DragAndDropTable> {
  final String text = """
Bronze le muet avait l'oreille fine. Bien qu'il se trouvât à l'in
térieur de la maison, il entendit distinctement tout ce 
que les haut-parleurs transmirent. Le soir, il sortit avant 
d'avoir terminé son repas et emmena le buffle avec lui.
""";

  final List<String> candidates = ["fine", "son"];
  final Map<int, String> targetIndexes = {5: "fine", 32: "son"};
  final Map<int, String> matchedWords = {};

  List<String> splitText() {
    return text.split(RegExp(r'(\s+|\b)')); // Split the text preserving spaces and punctuation
  }

  @override
  Widget build(BuildContext context) {
    final words = splitText();

    return Scaffold(
      appBar: AppBar(
        title: Text("Drag and Drop in Table"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Table(
          border: TableBorder.all(color: Colors.grey),
          children: [
            TableRow(
              children: [
                // Left column: Text without candidates
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Wrap(
                    spacing: 4.0,
                    runSpacing: 8.0,
                    children: words.asMap().entries.map((entry) {
                      final index = entry.key;
                      final word = entry.value;

                      // If it's a target word, show a DragTarget
                      if (targetIndexes.containsKey(index) &&
                          !matchedWords.containsKey(index)) {
                        return DragTarget<String>(
                          onAccept: (data) {
                            if (data == targetIndexes[index]) {
                              setState(() {
                                matchedWords[index] = data;
                              });
                            }
                          },
                          builder: (context, candidateData, rejectedData) {
                            return Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 4.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Text(
                                matchedWords[index] ?? "__",
                                style: TextStyle(fontSize: 16),
                              ),
                            );
                          },
                        );
                      }

                      // Render normal words
                      return Text(
                        word,
                        style: TextStyle(fontSize: 16),
                      );
                    }).toList(),
                  ),
                ),
                // Right column: Candidate words
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Column(
                    children: candidates
                        .where((word) => !matchedWords.containsValue(word))
                        .map((word) => Draggable<String>(
                              data: word,
                              feedback: Material(
                                color: Colors.transparent,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12.0, vertical: 8.0),
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Text(
                                    word,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                              ),
                              childWhenDragging: Opacity(
                                opacity: 0.5,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12.0, vertical: 8.0),
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Text(
                                    word,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                              ),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 8.0),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Text(
                                  word,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
