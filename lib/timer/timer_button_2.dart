import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';


// Disabled the button initially then again disabled for every given seconds
class TimerButton2 extends StatefulWidget {
  const TimerButton2({Key? key}) : super(key: key);

  @override
  State<TimerButton2> createState() => _TimerButton2State();
}

class _TimerButton2State extends State<TimerButton2> {

  bool isButtonDisabled = true; // Initially disable the button
  int _secondsRemaining = 10; // Enable the button after 5 seconds
  Timer? _timer;

  // used to indicate the no. of times the user pressed the button
  int count = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining == 0) {
        _timer?.cancel();
        setState(() {
          isButtonDisabled = false; // Enable the button after 5 seconds
        });
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  void _handleButtonPress() {
    count++;
    log("count $count");

    if (!isButtonDisabled) {
      setState(() {
        isButtonDisabled = true;
        _secondsRemaining = 5; // Set the desired time in seconds

        if(count == 3 || count == 4){
          _secondsRemaining = 6; // increasing the time
        }

        if(count == 5){
          _secondsRemaining = 7; // increasing the time
        }
      });

      _timer = Timer.periodic(
          const Duration(seconds: 1),
              (timer) {
            if (_secondsRemaining == 0) {
              _timer?.cancel();
              setState(() {
                isButtonDisabled = false;
              });
            } else {
              setState(() {
                _secondsRemaining--;
              });
            }
          }
      );
    }

    if(count == 5){
      log("Session ended: count = $count");
    }
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
            if(isButtonDisabled)
              Text(
                'Retry again in ($_secondsRemaining)',
              ),
            ElevatedButton(
              onPressed: isButtonDisabled ? null : _handleButtonPress,
              child: const Text('Press'),
            ),
          ],
        ),
      ),
    );
  }

}
