import 'package:flutter/material.dart';


class DropdownDemo extends StatefulWidget {
  const DropdownDemo({Key? key}) : super(key: key);
  @override
  State<DropdownDemo> createState() => _DropdownDemoState();
}
class _DropdownDemoState extends State<DropdownDemo> {
  String dropdownValue = 'Dog';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: ...,
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          // Step 2.
          DropdownButton<String>(
            // Step 3.
            value: dropdownValue,
            // Step 4.
            items: <String>['Dog', 'Cat', 'Tiger', 'Lion']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: const TextStyle(fontSize: 30),
                ),
              );
            }).toList(),
            // Step 5.
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Selected Value: $dropdownValue',
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}