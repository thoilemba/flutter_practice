import 'package:flutter/material.dart';

class MyBuildContext extends StatelessWidget {
  const MyBuildContext({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('2 $context');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Testing'),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("This is SnackBar"),
            backgroundColor: Colors.green,
          ));
          print('3 $context');
        }
      )
    );
  }
}
