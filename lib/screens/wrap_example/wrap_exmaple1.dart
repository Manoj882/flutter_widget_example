import 'package:flutter/material.dart';

class WrapExample1 extends StatefulWidget {
  const WrapExample1({super.key});

  @override
  State<WrapExample1> createState() => _WrapExample1State();
}

class _WrapExample1State extends State<WrapExample1> {
  static const List<String> _languages = [
    "Hindi",
    "English",
    "Chinese",
    "Nepali",
    "English"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wrap Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                decoration:
                    BoxDecoration(color: Colors.orange.withOpacity(0.1)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CircleAvatar(),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text('Title: Wrap Example'),
                          Wrap(
                              runSpacing: 0,
                              spacing: 4,
                              children: _languages
                                  .map(
                                    (lang) => Chip(
                                      label: Text(lang),
                                      padding: EdgeInsets.zero,
                                    ),
                                  )
                                  .toList()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
