import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// State management using Provider package
class Level1 extends StatelessWidget {
  const Level1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Level2();
  }
}

class Level2 extends StatelessWidget {
  const Level2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        MyTextField(),
        Level3(),
      ],
    );
  }
}

class Level3 extends StatelessWidget {
  const Level3({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Data in Level 3 : ${Provider.of<Data>(context).data}');
  }
}

class MyText extends StatelessWidget {
  const MyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<Data>(context).data);
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (newText){
        Provider.of<Data>(context, listen: false).changeData(newText);
      },
    );
  }
}

class Data extends ChangeNotifier {
  String data = 'Some Dynamic Data';

  void changeData(String newData){
    data = newData;
    notifyListeners();
  }
}