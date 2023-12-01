import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';

// Automatically called a method for every 3 seconds for 1 minute

class TimerFunction extends StatefulWidget {
  const TimerFunction({Key? key}) : super(key: key);

  @override
  State<TimerFunction> createState() => _TimerFunctionState();
}

class _TimerFunctionState extends State<TimerFunction> {

  Timer? _timer;
  int _secondsRemaining = 3;

  // used to indicate the no. of times the method execute
  int count = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // used to indicate the time remaining for each interval
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _secondsRemaining--;
      });
    });

    const duration = Duration(seconds: 3); // Set the time interval

    // Create a periodic timer that runs for each given seconds
    Timer.periodic(duration, (Timer timer) {
      if (count < 12) {
        // Continue calling the function for 1 minute (12 iterations)
        yourFunctionToCall(); // Call your function here
        setState(() {
          count++;
          _secondsRemaining = 3;
        });

      } else {
        timer.cancel(); // Stop the timer after 1 minute
      }
    });
  }


  // Function to be called
  void yourFunctionToCall() {
    log('Function called at: ${DateTime.now()}');
    // Add your function code here
  }

  @override
  void dispose() {
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
            // if(count < 12)
              Text(
              'Retry again in ($_secondsRemaining)',
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
