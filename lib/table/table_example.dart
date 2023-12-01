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
              0: FlexColumnWidth(2), // Make the first column twice as wide
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



// import 'dart:convert';
// import 'package:flutter/material.dart';
//
// class MyTablePage extends StatefulWidget {
//   @override
//   _MyTablePageState createState() => _MyTablePageState();
// }
//
// class _MyTablePageState extends State<MyTablePage> {
//   List<List<dynamic>> tableData = [];
//
//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }
//
//   // Replace this method with your method to fetch data from a JSON file
//   void fetchData() async {
//     // Simulating fetching data from a JSON file
//     String jsonString = '''
//       {
//         "data": [
//           ["", "ImuZgi", "miZgO"],
//           ["1", "AEbu poKp", "Ipa (Ipa IbuZzo/pabuZ)"],
//           ["2", "AEbu poKpi", "Ima (Ima IbeMm)"],
//           ["3", "Ipagi mpa", "Ipu (Ipu IbuZzo)"],
//           ["4", "Ipagi mma", "IboK (IboK IbeMm)"],
//           ["5", "Ipugi mpa bbbbbbbbbbbbbbbbbddddddddddddddddddddddddddddddd", "IpupoK (IbuboK)"]
//         ]
//       }
//     ''';
//
//     Map<String, dynamic> jsonData = json.decode(jsonString);
//
//     setState(() {
//       tableData = List<List<dynamic>>.from(jsonData['data']);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Table Page'),
//       ),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: DataTable(
//           columns: [
//             DataColumn(label: Text(' 1')),
//             DataColumn(label: Text(' 2')),
//             DataColumn(label: Text(' 3')),
//           ],
//           rows: tableData.map((rowData) {
//             return DataRow(
//               cells: rowData.map((cellData) {
//                 return DataCell(Text('$cellData'));
//               }).toList(),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }

