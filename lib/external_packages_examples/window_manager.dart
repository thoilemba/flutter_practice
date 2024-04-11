import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

// This screen allows screenshot and screen recording
class UnsecureScreen extends StatelessWidget {
  const UnsecureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Screen 1'),
      ),
      body: Center(
        child: ElevatedButton(
          // color: Colors.red,
          child: const Text('Go Forwards To Screen 2'),
          // Navigate to Screen 2
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const SecureScreen();
            }));
          },
        ),
      ),
    );
  }
}

// This screen does not allow screenshot and screen recording
class SecureScreen extends StatefulWidget {
  const SecureScreen({super.key});

  @override
  State<SecureScreen> createState() => _SecureScreenState();
}

class _SecureScreenState extends State<SecureScreen> {

  //TODO: Prevents taking screenshot and screen recording
  Future<void> secureScreen() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  // TODO: Enabled when the specific screen is closed
  Future<void> secureScreenOff() async {
    await FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
  }

  @override
  void initState() {
    secureScreen();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

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
            backgroundColor: MaterialStateProperty.all(Colors.purple),
          ),

          child: const Text('Go Back To Screen 1'),
          onPressed: () {
            Navigator.pop(context); // popping this Screen 2
          },
        ),
      ),
    );
  }
}