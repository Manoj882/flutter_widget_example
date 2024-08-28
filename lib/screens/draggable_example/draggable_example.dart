import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DraggableExample extends StatefulWidget {
  const DraggableExample({super.key});

  @override
  State<DraggableExample> createState() => _DraggableExampleState();
}

class _DraggableExampleState extends State<DraggableExample> {
  bool isSuccessful = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Draggable Example'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DragTarget(
            builder: (context, List<dynamic> candidateData,
                List<dynamic> rejectedData) {
              return Center(
                child: isSuccessful
                    ?  Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: Container(
                          color: Colors.yellow,
                          height: 200,
                          width: 200,
                          child: const Center(
                            child: FlutterLogo(
                              size: 100,
                            ),
                          ),
                        ),
                      )
                    : Container(
                        height: 200,
                        width: 200,
                        color: Colors.yellow,
                      ),
              );
            },

            onWillAcceptWithDetails: (data){
              return true;
            },

            onAcceptWithDetails: (data){
              setState(() {
                isSuccessful = true;
              });
            },
          ),

          const SizedBox(height: 50,),
          Draggable(
            data: 'Flutter',
            child:  FlutterLogo(
              size: 100,
            ),
            feedback: FlutterLogo(
              size: 100,
            ),
            childWhenDragging: Container(),
          ),
        ],
      ),
    );
  }
}
