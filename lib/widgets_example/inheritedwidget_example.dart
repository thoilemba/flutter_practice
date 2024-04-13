import 'package:flutter/material.dart';

// https://api.flutter.dev/flutter/widgets/InheritedWidget-class.html

// Define a custom InheritedWidget class to hold the shared data
class MyInheritedWidget extends InheritedWidget {
  // Data to be shared
  final int counter;

  // Constructor
  const MyInheritedWidget({super.key,
    required this.counter,
    required Widget child,
  }) : super(child: child);

  // Static method to access the nearest ancestor instance of MyInheritedWidget
  static MyInheritedWidget of(BuildContext context) {
    // Calls the context.inheritFromWidgetOfExactType method to obtain the nearest ancestor of the given type
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()!;
  }

  // This method is called when the data changes and Flutter needs to determine whether to rebuild descendants
  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    // Return true if the data in this object is different from the data in the oldWidget
    return counter != oldWidget.counter;
  }
}

class InheritedWidgetExample extends StatefulWidget {
  const InheritedWidgetExample({super.key});

  @override
  InheritedWidgetExampleState createState() => InheritedWidgetExampleState();
}

class InheritedWidgetExampleState extends State<InheritedWidgetExample> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyInheritedWidget(
        counter: _counter, // Provide the shared data to the descendants
        child: Scaffold(
          appBar: AppBar(
            title: const Text('InheritedWidget Example'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Counter value:',
                ),
                // Use Builder widget to access the shared data from the InheritedWidget
                Builder(
                  builder: (context) {
                    // Access the shared data using the of() method
                    int counter = MyInheritedWidget.of(context).counter;
                    return Text(
                      '$counter',
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  },
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
