import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/screens_for_navigation/screen0.dart';
import 'package:practice/screens_for_navigation/screen1.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  static const String routeName = "/screen2";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Screen 2'),
      ),
      body: Center(
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.purple),
          ),

          child: const Text('Go Back To Screen 0'),
          onPressed: () {
            // Navigator.pushNamed(context, '/');
            // Navigator.pop(context, const Screen0());
            // Navigator.pop(context, const Screen1());
            // Navigator.popAndPushNamed(context, '/');
            Get.offAll(
              () => const Screen0()
            ); // Using get package
          },
        ),
      ),
    );
  }
}