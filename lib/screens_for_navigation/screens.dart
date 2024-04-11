import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Screen Navigation using Navigator and Get package

/*
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      // home: MyHomePage(title: 'Testing Example',),
      // home: Screen0(),
      initialRoute: '/',
      routes: {
        '/' : (context) => const Screen0(),
        Screen1.routeName : (context) => const Screen1(),
        Screen2.routeName : (context) => const Screen2()
      },
    );
  }
}
 */

class Screen0 extends StatelessWidget {
  const Screen0({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Screen 0'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              child: const Text('Go To Screen 1'),
              onPressed: () {
                //Navigate to Screen 1
                // Navigator.pushNamed(context, Screen1.routeName);
                Get.to(() => const Screen1()); // Using get package
              },
            ),
            ElevatedButton(
              child: const Text('Go To Screen 2'),
              onPressed: () {
                //Navigate to Screen 2
                // Navigator.pushNamed(context, Screen2.routeName);
                Get.to(() => const Screen2()); // Using get package
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  static const String routeName = "/screen1";

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
          onPressed: () {
            // Navigator.pushNamed(context, Screen2.routeName);
            Get.to(() => const Screen2()); // Using get package
          },
        ),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  static const String routeName = "/screen2";

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

          child: const Text('Go Back To Screen 0'),
          onPressed: () {
            Navigator.pushNamed(context, '/');
            Navigator.pop(context, const Screen0());
            Navigator.pop(context, const Screen1());
            Navigator.popAndPushNamed(context, '/');
            // Get.offAll(
            //    () => const Screen0()
            // ); // Using get package
          },
        ),
      ),
    );
  }
}