import 'package:flutter/material.dart';
import 'package:flutter_widget_example/screens/website_view_example/my_website.dart';

class WebsiteViewExample extends StatelessWidget {
  const WebsiteViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Web View In App Example'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyWebSite(),
                  ),
                );
              },
              child: const Text('View Website'),
            ),
          ],
        ),
      ),
    );
  }
}
