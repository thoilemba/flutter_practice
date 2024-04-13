import 'package:flutter/material.dart';

class ContainerExample extends StatelessWidget {
  const ContainerExample({super.key});

  @override
  Widget build(BuildContext context) {

    double totalWidth = MediaQuery.of(context).size.width;
    double totalHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('LayoutBuilder Example'),
      ),
      body: Container(
        color: Colors.black,
        height: 300,
        width: 300,
        child: Center(
          child: Container(
            height:200,
            width: 200,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
