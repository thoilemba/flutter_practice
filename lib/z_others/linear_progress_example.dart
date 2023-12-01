import 'package:flutter/material.dart';

class LinearProgressExample extends StatelessWidget {
  const LinearProgressExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicator Example'),
      ),
      body: Center(
        child: LinearProgressIndicator(
          value: 0.7, // Set the value to indicate progress (0.0 to 1.0)
          minHeight: 10, // Adjust the height of the indicator
          backgroundColor: Colors.grey[300], // Background color
          valueColor: const AlwaysStoppedAnimation<Color>(
              Colors.green), // Indicator color
        ),
      ),
    );
  }
}