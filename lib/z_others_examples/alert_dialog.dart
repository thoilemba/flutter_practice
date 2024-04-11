import 'package:flutter/material.dart';

class AlertDialogExample extends StatelessWidget {
  const AlertDialogExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Alert Dialog Example',
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                actionsAlignment: MainAxisAlignment.center,
                title: const Center(child: Text('Hello World')),
                content: const Text(
                  "Congratulations!",
                  // getTransactionMessage(txtSts),
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                actions: [
                  SizedBox(
                    // width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Close")),
                  ),
                ],
              ),
            );
          },
          child: const Text(
            'Alert Dialog',
          ),
        ),
      ),
    );
  }
}
