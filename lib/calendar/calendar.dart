import 'package:flutter/material.dart';

class CalendarPageView extends StatefulWidget {
  const CalendarPageView({super.key});

  @override
  CalendarPageViewState createState() => CalendarPageViewState();
}

class CalendarPageViewState extends State<CalendarPageView> {
  late PageController _pageController;
  int _currentPageIndex = DateTime.now().month - 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: 12,
        itemBuilder: (BuildContext context, int index) {
          DateTime dateTime = DateTime(DateTime.now().year, index + 1, 1);
          return MonthView(dateTime: dateTime, key: null,);
        },
        onPageChanged: (int pageIndex) {
          setState(() {
            _currentPageIndex = pageIndex;
          });
        },
      ),
    );
  }
}

class MonthView extends StatelessWidget {
  final DateTime dateTime;

  const MonthView({super.key, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '${dateTime.month}/${dateTime.year}',
        style: const TextStyle(fontSize: 24.0),
      ),
    );
  }
}
