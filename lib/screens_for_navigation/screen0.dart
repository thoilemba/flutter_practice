import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/screens_for_navigation/screen1.dart';
import 'package:practice/screens_for_navigation/screen2.dart';

class Screen0 extends StatelessWidget {
  const Screen0({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Screen 0'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              child: const Text('Go To Screen 1'),
              onPressed: () {
                //Navigate to Screen 1
                // Navigator.pushNamed(context, Screen1.routeName);
                Get.to(() => const Screen1()); // Using get package
              },
            ),
            ElevatedButton(
              child: const Text('Go To Screen 2'),
              onPressed: () {
                //Navigate to Screen 2
                // Navigator.pushNamed(context, Screen2.routeName);
                Get.to(() => const Screen2()); // Using get package
              },
            ),
          ],
        ),
      ),
    );
  }
}