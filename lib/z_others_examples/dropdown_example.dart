
import 'package:flutter/material.dart';

class DropDownExample extends StatefulWidget {
  const DropDownExample({super.key});

  @override
  DropDownExampleState createState() => DropDownExampleState();
}

class DropDownExampleState extends State<DropDownExample> {
  bool isListViewVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hide/Unhide ListView'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                // Toggle the visibility of the ListView
                isListViewVisible = !isListViewVisible;
              });
            },
            child: const Text('Toggle ListView Visibility'),
          ),
          Visibility(
            visible: isListViewVisible,
            child: Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Item $index'),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}