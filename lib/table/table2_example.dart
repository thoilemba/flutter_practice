import 'dart:convert';
import 'package:flutter/material.dart';

class Table2Example extends StatelessWidget {
  final String jsonData = '''
    {
      "data": [
        ["", "ImuZgi", "miZgO"],
        ["1", "AEbu poKp", "Ipa (Ipa IbuZzo/pabuZ)"],
        ["2", "AEbu poKpi", "Ima (Ima IbeMm)"],
        ["3", "Ipagi mpa", "Ipu (Ipu IbuZzo)"],
        ["4", "Ipagi mma", "IboK (IboK IbeMm)"],
        ["5", "Ipugi mpa", "IpupoK (IbuboK)"]
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
