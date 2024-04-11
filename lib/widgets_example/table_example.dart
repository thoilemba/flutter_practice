import 'package:flutter/material.dart';

class TableExample extends StatelessWidget {
  final List<List<String>> data = [
    ['Name', 'Age', 'Country'],
    ['John', '25', 'USA'],
    ['Alice', '30', 'Canada'],
    ['Bob', '22', 'UK'],
  ];

  TableExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dynamic Table Example'),
        ),
        body: Center(
          child: Table(
            border: TableBorder.all(),
            columnWidths: const {
              0: FlexColumnWidth(2), // Making the width of first column twice than others
            },
            children: data.map((row) {
              return TableRow(
                children: row.map((cell) {
                  return TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text(cell)),
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

