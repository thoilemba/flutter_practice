import 'package:flutter/material.dart';

class ShadowOverlay extends StatelessWidget {
  const ShadowOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Gradient Overlay Example'),
        ),
        body: Stack(
          children: [
            Image.network(
              'https://picsum.photos/800/500',
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 15,
                      blurRadius: 9,
                      offset: const Offset(0, -14),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
