import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class LottieAnimationExample extends StatefulWidget {
  const LottieAnimationExample({super.key});

  @override
  State<LottieAnimationExample> createState() => _LottieAnimationExampleState();
}

class _LottieAnimationExampleState extends State<LottieAnimationExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isBlast = false;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this)
          ..forward();

    _animation = Tween<double>(begin: 1, end: 1.2).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isBlast = true;
        });
        _animationController.reverse();
      } else if (status == AnimationStatus.reverse) {
        
        Future.delayed(const Duration(milliseconds: 300), () {
          setState(() {
            _isBlast = false;
          });
          
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          _isBlast = false;
        });

        _animationController.forward();
      }

      print('hello is blast: $_isBlast');
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lottie Animation Example'),
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              if (_isBlast)
                Positioned(
                  right: 20,
                  bottom: 50,
                  child: Lottie.asset(
                    'assets/lottie/blast.json',
                    height: 160,
                    width: 120,
                    reverse: false,
                    repeat: false,
                  
                  ),
                ),
              Positioned(
                right: 20,
                bottom: 10,
                child: ScaleTransition(
                  scale: _animation,
                  child: Image.asset(
                    'assets/svg/mypay_mela.png',
                    height: 120,
                    width: 120,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
