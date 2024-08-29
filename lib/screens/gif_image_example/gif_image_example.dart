import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GifImageExample extends StatelessWidget {
  const GifImageExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GIF Image Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                debugPrint('I am pressed');
              },
              style: ElevatedButton.styleFrom(padding: EdgeInsets.all(2)),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.network(
                      'https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExZHhsYmhiNHBvZHFmNnU4eHQzMzFwMmlncGY2YWY5N244em1hd202cSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/3oz8xtZ1oag8BCKJFe/giphy.webp',
                      height: 40,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),

                  const Positioned.fill(
                    child: Center(child: Text('Apply Coupon')),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
