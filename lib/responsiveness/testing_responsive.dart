import 'package:flutter/material.dart';

class TestingResponsive extends StatelessWidget {
  const TestingResponsive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children:  <Widget>[
        Container(color: Colors.yellow, height: 300,),
        Container(
          height: 300,
          color: Colors.blue,
          child: const FittedBox(
            fit: BoxFit.contain,
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              style: TextStyle(
                fontSize: 30,
                color: Colors.red,
              ),
            ),
          ),
        ),
        Container(
          height: 300,
          color: Colors.lightGreen,
          child: const FittedBox(
            fit: BoxFit.contain,
            child: Text(
              'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              style: TextStyle(
                fontSize: 30,
                color: Colors.blue,
              ),
            ),
          ),
        ),
        Container(
          height: 300,
          color: Colors.grey,
          child: const FittedBox(
            child: Text(
              'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
              style: TextStyle(
                fontSize: 30,
                color: Colors.green,
              ),
            ),
          ),
        ),
        Container(
          color: Colors.yellow,
          height: 300,
        )
      ],
    );
  }
}
