import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FlutterHooksExample extends HookWidget {
  FlutterHooksExample({super.key});

  // Create a stateful value using the useState hook
  final count = useState(7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Count:',
                style: TextStyle(fontSize: 24),
              ),
              Text(
                '${count.value}',
                style: const TextStyle(fontSize: 48),
              ),
              ElevatedButton(
                onPressed: () => count.value++,
                child: const Text('Increment'),
              ),
            ],
          ),
        ),
    );
  }
}
