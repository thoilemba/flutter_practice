import 'dart:convert';
import 'package:flutter/material.dart';

class Table2Example extends StatelessWidget {
  final String jsonData = '''
    {
      "data": [
        ["ID", "Name", "Age"],
        ["1", "John", "27"],
        ["2", "Jack", "28"],
        ["3", "Adam", "29"],
        ["4", "Mary", "25"],
        ["5", "Rose", "26"]
      ]
    }
  ''';

  const Table2Example({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> data = jsonDecode(jsonData);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Table from JSON Example'),
        ),
        body: Center(
          child: Table(
            border: TableBorder.all(),
            columnWidths: const {
              0: FlexColumnWidth(0.5),
              1: FlexColumnWidth(1),
              2: FlexColumnWidth(1),
            },
            children: (data['data'] as List).map((row) {
              return TableRow(
                children: row.map<Widget>((cell) {
                  return TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text('$cell')),
                    ),
                  );
                }).toList(),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
