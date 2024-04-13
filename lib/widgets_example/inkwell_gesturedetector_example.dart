import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/*
  InkWell provides a Material Design ripple effect by default when tapped,
  which is visually appealing and consistent with other Material Design elements.
  GestureDetector does not provide any built-in visual feedback.
  https://api.flutter.dev/flutter/material/InkWell-class.html
  https://api.flutter.dev/flutter/widgets/GestureDetector-class.html
 */
class InkWellAndGestureExample extends StatelessWidget {
  const InkWellAndGestureExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InkWell and Gesture Example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: InkWell(
              onTap: () {
                // Handle the tap event
                if (kDebugMode) {
                  print('InkWell Button tapped!');
                }
              },
              child: Ink(
                color: Colors.green,
                padding: const EdgeInsets.all(8),
                child: const Text(
                  'InkWell Button',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                // Handle the tap event
                if (kDebugMode) {
                  print('Gesture Button tapped!');
                }
              },
              child: Ink(
                color: Colors.blue,
                padding: const EdgeInsets.all(8),
                child: const Text(
                  'Gesture Button',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
