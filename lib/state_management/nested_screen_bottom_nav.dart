import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class NestedScreenBottomNav extends StatefulWidget {
  const NestedScreenBottomNav({super.key});

  @override
  NestedScreenBottomNavState createState() => NestedScreenBottomNavState();
}

class NestedScreenBottomNavState extends State<NestedScreenBottomNav> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Navigation Example'),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          Tab1Screen(),
          const TabScreen(title: 'Tab 2'),
          const TabScreen(title: 'Tab 3'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Tab 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Tab 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Tab 3',
          ),
        ],
      ),
    );
  }
}


class TabScreen extends StatelessWidget {
  final String title;

  const TabScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.green,
          fontSize: 24,
        ),
      ),
    );
  }
}

class Tab1Screen extends StatelessWidget {
  Tab1Screen({super.key});

  final _mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {

    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),

          if (_mainController.nestedPage.value == 0)
          // Content of Nested Screen 1
            Center(
              child: Column(
                children: [
                  const Text(
                    'Main Screen of Tab 1',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _mainController.changeNestedPage(1);
                    },
                    child: const Text('Go to nested Screen 1'),
                  ),
                ],
              ),
            ),
          if (_mainController.nestedPage.value == 1)
          // Content of Nested Screen 2
            const NestedScreen(), // Include NestedScreen2 widget
        ],
      ),
    );
  }
}

class NestedScreen extends StatefulWidget {
  const NestedScreen({super.key});

  @override
  State<NestedScreen> createState() => _NestedScreenState();
}

class _NestedScreenState extends State<NestedScreen> {

  final _mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            _mainController.changeNestedPage(0);
          },
          child: const Icon(
              Icons.arrow_back
          ),
        ),
        const Center(
          child: Text('Nested Screen 1 Content'),
        ),
      ],
    );
  }
}

// State class using Get state management
class MainController extends GetxController {

  RxInt nestedPage = 0.obs; // state variable

  // changing the state variable and updating
  void changeNestedPage(int index) {
    nestedPage.value = index;
    update();

    if (kDebugMode) {
      print(nestedPage.value);
    }
  }
}
