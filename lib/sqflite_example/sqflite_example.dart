import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'db_helper.dart';

class SqfliteExample extends StatelessWidget {

  SqfliteExample({super.key});

  final dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQLite Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await dbHelper.insertTask('Example Task');
            if (kDebugMode) {
              print('Task inserted');
            }
          },
          child: const Text('Insert Task'),
        ),
      ),
    );
  }
}
