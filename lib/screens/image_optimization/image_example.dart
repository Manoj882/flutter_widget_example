import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

class ImageExample extends StatefulWidget {
  const ImageExample({super.key});

  @override
  State<ImageExample> createState() => _ImageExampleState();
}

class _ImageExampleState extends State<ImageExample> {


//    String imageUrl = '';

//   @override
//   void initState() {
    
//     super.initState();
//     cropImage(imageUrl){}
//   }




//   Future<String> cropImage(String imageFile) async {
//   final croppedFile = await ImageCropper().cropImage(
//     sourcePath: imageFile,
//     uiSettings: [
//       AndroidUiSettings(
//         toolbarTitle: 'Cropper',
//         toolbarColor: Colors.deepOrange,
//         toolbarWidgetColor: Colors.white,
//         aspectRatioPresets: [
//           CropAspectRatioPreset.original,
//           CropAspectRatioPreset.square,
    
//         ],
//       ),
//       IOSUiSettings(
//         title: 'Cropper',
//         aspectRatioPresets: [
//           CropAspectRatioPreset.original,
//           CropAspectRatioPreset.square,
       
//         ],
//       ),
//       WebUiSettings(
//         context: context,
//       ),
//     ],
//   );

//   if (croppedFile != null) {
//     return croppedFile.path;
//   }
// }




  @override
  Widget build(BuildContext context) {
    final double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

    print('device pixel ratio: $devicePixelRatio');

    print('device pixel ratio: $devicePixelRatio');
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    print('screen width: $screenWidth');
    print('screen height: $screenHeight');

    // print('actual body height: ${MediaQuery.of(context).size.height- MediaQuery.of(context).padding.top - kToolbarHeight}');

    // Calculate cache width and height based on device's screen size and pixel ratio
    final int cacheWidth = (screenWidth * devicePixelRatio).round();
    final int cacheHeight = (screenHeight * devicePixelRatio).round();

    print('cache width: $cacheWidth');
    print('cache height: $cacheHeight');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Optimization'),
      ),
      body: 
      Center(
        // child: Image.asset(
        //   'assets/svg/background.jpg',
        //   height: 250,
        //   width: 250,
        //   cacheWidth: 250.cacheSize(context),
        //  cacheHeight: 250.cacheSize(context),
        //   fit: BoxFit.cover,
        // ),

        child: ColoredBox(
          color: Colors.green,
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Get the display size from the constraints
              final displayWidth = constraints.maxWidth;
              final displayHeight = constraints.maxHeight;

              print('display width: $displayWidth');
              print('display height: $displayHeight');

          
              // Set cache dimensions based on the display size and pixel ratio
              final adaptiveCacheWidth = (displayWidth * devicePixelRatio).round();
              final adaptiveCacheHeight = (displayHeight * devicePixelRatio).round();
          
              print('Adaptive Cache Width: $adaptiveCacheWidth');
              print('Adaptive Cache Height: $adaptiveCacheHeight');

              print('cache size width: ${displayWidth.cacheSize(context)}');
              print('cache size height: ${displayHeight.cacheSize(context)}');
              return Image(
                image: ResizeImage(
                  policy: ResizeImagePolicy.exact,
                  AssetImage(
                    'assets/svg/background.jpg',
                  ),
                
                  //height: 500.round(), // not give height
                  width: 500.cacheSize(context),
                
                ),
                width: 500,
                height: displayHeight,
                 fit: BoxFit.cover,
              
              );
            }
          ),
        ),
      
      ),
    );
  }
}

extension ImageExtension on num {
  int cacheSize(BuildContext context){
    print('value of this: $this');
    return (this * MediaQuery.of(context).devicePixelRatio).round();
  }
}

