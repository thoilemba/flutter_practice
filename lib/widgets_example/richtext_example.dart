import 'package:flutter/material.dart';

/*
  The RichText widget in Flutter is used to display text with varying styles within
  the same text widget. It allows you to apply different text styles, such as different
  fonts, sizes, colors, and decorations, to different parts of the text.
 */

class RichTextExample extends StatelessWidget {
  const RichTextExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RichText Example'),
      ),
      body: Center(
        child: RichText(
          text: const TextSpan(
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'Hello ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: 'world!',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}