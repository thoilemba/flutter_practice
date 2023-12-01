import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


// Navigation using Get and showing Dialog box when screen navigates
class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Screen 1'),
      ),
      body: Center(
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green),
          ),
          child: const Text('Go Forwards To Screen 2'),
          // Navigate to Screen 2
          onPressed: () async {
            // getting the result passed by the Screen2()
            var result = await Get.to(() => const SecondPage());
            if(result == 'Success'){
              log("Get back result : $result");
              if(context.mounted){
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Successful"),
                    content: const Text(
                      "Gone back successfully",
                      textAlign: TextAlign.center,
                    ),
                    actions: [
                      TextButton(
                          onPressed: () => Get.back(), child: const Text("Close")),
                    ],
                  ),
                );
              }
            }
          },
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Screen 2'),
      ),
      body: Center(
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
          ),
          child: const Text('Go Back To Screen 1'),
          onPressed: () {
            Get.back(
              result: "Success", // passing string argument
            ); // popping this Screen 2
          },
        ),
      ),
    );
  }
}