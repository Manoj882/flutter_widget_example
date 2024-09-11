import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ConfettieExample extends StatefulWidget {
  const ConfettieExample({super.key});

  @override
  State<ConfettieExample> createState() => _ConfettieExampleState();
}

class _ConfettieExampleState extends State<ConfettieExample>
    with SingleTickerProviderStateMixin {
  final _confettiController = ConfettiController(duration: const Duration(seconds: 30));
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    //confettiController.play();
    _animationController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this)
          ..forward();

    _animation = Tween<double>(begin: 1, end: 1.2).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _animation.addStatusListener((status) {
    
      if(status == AnimationStatus.completed){
        _confettiController.play();
        _animationController.reverse();
      } 
      if(status == AnimationStatus.dismissed){
        _confettiController.stop();
        _animationController.forward();
      }
      

     });
  }

  @override
  void dispose() {
    _confettiController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  
     return Scaffold(
      appBar: AppBar(
        title: const Text('Confetti Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,

          children: [
            
            Stack(
              alignment: Alignment.center,
              children: [
                // ConfettiWidget with star-shaped particles, aligned at the center of the image
                ConfettiWidget(
                  confettiController: _confettiController,
                  blastDirectionality: BlastDirectionality.explosive,
                  maxBlastForce: 40,
                  emissionFrequency: 0.03,
                  numberOfParticles: 40,
                  gravity: 0.1,
                  colors: const [Colors.red, Colors.blue, Colors.green, Colors.yellow],
                  //createParticlePath: drawStar, // Use star shape for particles
                  blastDirection: pi / 2, // Set direction upwards
                ),
                // Image with ScaleTransition
                ScaleTransition(
                  scale: _animation,
                  child: Image.asset(
                    'assets/svg/mypay_mela.png',
                    height: 120,
                    width: 120,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ],
            ),

           const SizedBox(height: 20,),

            const Text('Happy Dashain'),

            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }

  Path drawStar(Size size) {
   
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }
}
