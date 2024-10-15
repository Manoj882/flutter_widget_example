import 'package:flutter/material.dart';
import 'package:flutter_widget_example/screens/draggable_example/draggable_example.dart';
import 'package:flutter_widget_example/screens/flutter_html_example/flutter_html_example.dart';
import 'package:flutter_widget_example/screens/gif_image_example/gif_image_example.dart';
import 'package:flutter_widget_example/screens/image_optimization/image_example.dart';
import 'package:flutter_widget_example/screens/image_optimization/network_image_example.dart';
import 'package:flutter_widget_example/screens/pop_over_example/pop_over_example.dart';
import 'package:flutter_widget_example/screens/scrollable_example/scrollable_example.dart';
import 'package:flutter_widget_example/screens/website_view_example/website_view_example.dart';
import 'package:flutter_widget_example/screens/wrap_example/wrap_example.dart';

import 'screens/confettie_example/confettie_example.dart';
import 'screens/lottie_animation_example/lottie_animation_example.dart';

void main() {
  //debugInvertOversizedImages = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
  
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const PopOverWidgetExample(),
      //  home: DraggableExample(),
      // home: ScrollableExample(),
      // home: const WebsiteViewExample(),
      // home:  FlutterHtmlExample(),
      // home: GifImageExample(),
      // home: const CampaignDetailsScreen(),

      // home: const ImageExample(),

      // home: const NetworkImageExample(),
      // home: const WrapExample(),
      // home: const ConfettieExample(),
      home: const LottieAnimationExample(),
  

    );
  }
}



