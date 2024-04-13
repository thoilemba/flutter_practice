import 'package:flutter/material.dart';

/*
  Hero animations are used to visually connect two widgets when transitioning
  between screens, creating a smooth and visually appealing user experience.
 */
class HeroWidgetExample extends StatelessWidget {
  const HeroWidgetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DetailPage(),
              ),
            );
          },
          child: Hero(
            tag: 'imageHero',
            child: Image.asset(
              'images/logo.png',
              width: 100,
              height: 100,
            ),
          ),
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: Hero(
        tag: 'imageHero',
        child: Image.asset(
          'images/logo.png',
        ),
      ),
    );
  }
}