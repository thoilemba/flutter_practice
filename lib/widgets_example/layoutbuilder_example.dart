import 'package:flutter/material.dart';
/*
  The LayoutBuilder widget is particularly useful when you need to create
  responsive layouts that adapt to different screen sizes, orientations,
  or other layout constraints. It allows you to create flexible and
  dynamic UIs that can adjust their layout and appearance based on the
  available space. It receives constraints from its parent widget.

  https://api.flutter.dev/flutter/widgets/LayoutBuilder-class.html
 */
class LayoutBuilderExample extends StatelessWidget {
  const LayoutBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('LayoutBuilder Example'),
      ),
      body: Container(
        color: Colors.grey,
        height: 300,
        width: 300,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: Container(
                width: 200,
                height: 100,
                color: Colors.green,
                child: Center(
                  child: Text(
                    'Max Width: ${constraints.maxWidth.toStringAsFixed(2)}\nMax Height: ${constraints.maxHeight.toStringAsFixed(2)}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
