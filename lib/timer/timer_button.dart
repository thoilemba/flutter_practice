import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';

class TimerButton extends StatefulWidget {
  const TimerButton({Key? key}) : super(key: key);

  @override
  State<TimerButton> createState() => _TimerButtonState();
}

class _TimerButtonState extends State<TimerButton> {

  bool isButtonDisabled = false;
  int _secondsRemaining = 0;
  Timer? _timer;

  // used to indicate the no. of times the user pressed the button
  int count = 0;

  void _handleButtonPress() {
    count++;
    log("count $count");

    if(count == 5){
      log("Session ended: count = $count");
    }

    if (!isButtonDisabled) {
      setState(() {
        isButtonDisabled = true;
        _secondsRemaining = 5; // Set the desired time in seconds
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
            ElevatedButton(
              onPressed: isButtonDisabled ? null : _handleButtonPress,
              child: isButtonDisabled
                  ? Text('($_secondsRemaining) Press')
                  : const Text('Press')
            ),
          ],
        ),
      ),
    );
  }

}
