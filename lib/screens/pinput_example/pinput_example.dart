
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PinputExample extends StatelessWidget {
  const PinputExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pinput Example"),),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Pinput(
              length: 4,
              defaultPinTheme: PinTheme(
                width: 56,
                height: 56 ,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(50),
                )
              ),
            ),
          ),

        ],
      ),
    );
  }
}