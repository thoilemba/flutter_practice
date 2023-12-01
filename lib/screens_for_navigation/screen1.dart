import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/screens_for_navigation/screen2.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  static const String routeName = "/screen1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Screen 1'),
      ),
      body: Center(
        child: ElevatedButton(
          // color: Colors.red,
          child: const Text('Go Forwards To Screen 2'),
          onPressed: () {
            // Navigator.pushNamed(context, Screen2.routeName);
            Get.to(() => const Screen2()); // Using get package
          },
        ),
      ),
    );
  }
}