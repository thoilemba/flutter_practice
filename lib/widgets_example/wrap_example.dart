import 'package:flutter/material.dart';
/*
  Wrap widget is used to create a layout that wraps its children to
  the next line when there's not enough space in the current line.
 */

class WrapExample extends StatelessWidget {
  const WrapExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Wrap widget'),
        ),
        body: Wrap(
          spacing: 8.0, // gap between adjacent chips
          runSpacing: 10.0, // gap between lines
          children:  [
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.blue.shade900,
                child: const Text('LT'),
              ),
              label: const Text('This is a long text used in Chip widget'),
            ),
            const Chip(
              label: Text('Mango'),
            ),
            const Chip(
              label: Text('Grapes'),
            ),
            const Chip(
              label: Text('Watermelon'),
            ),
          ],
        )
    );
  }
}
