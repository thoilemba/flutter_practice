import 'package:flutter/material.dart';

// To add screen transition effect, we used PageView with BottomNavigationBar
class BottomNavAnimation extends StatefulWidget {
  const BottomNavAnimation({Key? key}) : super(key: key);

  @override
  State<BottomNavAnimation> createState() => _BottomNavAnimationState();
}

class _BottomNavAnimationState extends State<BottomNavAnimation> {

  int _selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bottom Navigation Using PageView")),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _selectedIndex = index);
          },
          children: <Widget>[
            Container(color: Colors.orange,),
            Container(color: Colors.red,),
            Container(color: Colors.green,),
            Container(color: Colors.blue,),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.purple,
        showSelectedLabels: true,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Item One',
            icon: Icon(Icons.home),
            backgroundColor: Color.fromARGB(221, 26, 26, 26),
          ),
          BottomNavigationBarItem(
            label: 'Item two',
            icon: Icon(Icons.apps),
            backgroundColor: Color.fromARGB(221, 26, 26, 26),
          ),
          BottomNavigationBarItem(
            label: 'Item three',
            icon: Icon(Icons.chat_bubble),
            backgroundColor: Color.fromARGB(221, 26, 26, 26),
          ),
          BottomNavigationBarItem(
            label:'Item four',
            icon: Icon(Icons.settings),
            backgroundColor: Color.fromARGB(221, 26, 26, 26),
          ),
        ],
      ),
    );
  }


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      //using this page controller you can make beautiful animation effects
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    });
  }
}