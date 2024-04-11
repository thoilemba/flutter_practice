import 'package:flutter/material.dart';

// Expanded widget force to fill the available space while flexible does not
class ExpandedVsFlexible extends StatelessWidget {
  const ExpandedVsFlexible({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Expanded and Flexible widget'
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            width: 200,
            color: Colors.red,
          ),
          Expanded(
            child: Container(
              height: 100,
              width: 200,
              color: Colors.blue,
            ),
          ),
          Flexible(
            // fit: FlexFit.tight, // applying this will to fill the available space
            child: Container(
              height: 100,
              width: 200,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
