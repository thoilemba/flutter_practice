import 'package:flutter/material.dart';

/*
  The ConstrainedBox widget is used to constrain the size of its child widget
  by applying minimum, maximum, or exact constraints on its dimensions.
 */
class ConstrainedBoxExample extends StatelessWidget {
  const ConstrainedBoxExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ConstrainedBox Example'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 100.0, // Minimum width of 100 pixels
              minHeight: 100.0, // Minimum height of 100 pixels
              maxWidth: 200.0, // Maximum width of 200 pixels
              maxHeight: 200.0, // Maximum height of 200 pixels
            ),
            child: Container(
              color: Colors.green,
              // if we give value smaller than 100, it will adjust to 100
              // if we give value larger than 200, it will adjust to 200
              width: 150.0, // Width of the container
              height: 150.0, // Height of the container
              child: const Center(
                child: Text(
                  'ConstrainedBox Example',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.orange,
            child: const Center(
              child: Text(
                'Container\n100*100',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Container(
            width: 200,
            height: 200,
            color: Colors.pink,
            child: const Center(
              child: Text(
                'Container\n200*200',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
