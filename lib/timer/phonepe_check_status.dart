import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';

// Automatically called a method for each given time intervals

class PhonepeStatusCheck extends StatefulWidget {
  const PhonepeStatusCheck({Key? key}) : super(key: key);

  @override
  State<PhonepeStatusCheck> createState() => _PhonepeStatusCheckState();
}

class _PhonepeStatusCheckState extends State<PhonepeStatusCheck> {

  Timer? _timer;
  int _secondsTaken = 0;

  // used to indicate the no. of times the method execute
  int count = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsTaken > 50) {
        log('stopped time');
        _timer?.cancel();
      } else {
        setState(() {
          _secondsTaken++;
        });
      }
    });
    Timer(const Duration(seconds: 5), yourFunctionToCall);

    int temp = 8;
    for(int i = 1; i <= 4; i++){
      Timer(Duration(seconds: temp), yourFunctionToCall);
      temp = temp+3;
    }

    // make i<= value+1 for the last interval
    for(int i = 1; i <= 5+1; i++){
      Timer(Duration(seconds: temp), yourFunctionToCall);
      temp = temp+6;
    }
  }

  void yourFunctionToCall() {
    log('Function called at: ${DateTime.now()}');
    // Add your function code here
  }

  @override
  void dispose() {
    log("dispose() called");
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Disable Button Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Count: $count',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            if(count < 12)
              Text(
                'Retry again in ($_secondsTaken)',
              ),
            if(count == 12)
              const Text(
                'Finished method call',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
          ],
        ),
      ),
    );
  }

}
