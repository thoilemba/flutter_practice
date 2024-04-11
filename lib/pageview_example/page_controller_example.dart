import 'package:flutter/material.dart';

// Passing page controller to one class to another
class MyParentClass extends StatefulWidget {
  const MyParentClass({super.key});

  @override
  MyParentClassState createState() => MyParentClassState();
}

class MyParentClassState extends State<MyParentClass> {
  final _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parent Class'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              // Call a function in the child class to update the page
              _pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            child: const Text('Next Page from Parent'),
          ),
          Expanded(
            child: MyChildClass(
              pageController: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Current Page in Parent: $_currentPage',
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}

class MyChildClass extends StatefulWidget {
  final PageController pageController;
  final Function(int) onPageChanged;

  const MyChildClass({super.key, required this.pageController, required this.onPageChanged});

  @override
  MyChildClassState createState() => MyChildClassState();
}

class MyChildClassState extends State<MyChildClass> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: widget.pageController,
      onPageChanged: widget.onPageChanged,
      children: [
        Container(color: Colors.blue),
        Container(color: Colors.green),
        Container(color: Colors.red),
      ],
    );
  }
}
