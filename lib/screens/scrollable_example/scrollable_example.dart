import 'package:flutter/material.dart';
import 'package:flutter_widget_example/screens/scrollable_example/character_widget.dart';

class ScrollableExample extends StatefulWidget {
  const ScrollableExample({super.key});

  @override
  State<ScrollableExample> createState() => _ScrollableExampleState();
}

class _ScrollableExampleState extends State<ScrollableExample> {
  final List<String> _list = [
   
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scrollable Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Scroll Content',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Container(
              width: double.infinity,
              color: Colors.red,
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: const Center(
                child: Text('Scroll under me'),
              ),
            ),
            
          const SizedBox(height: 20,),
        
          Expanded(child: CharacterWidget(listOfCharacter: _list)),
            
          ],
        ),
      ),
    );
  }
}
