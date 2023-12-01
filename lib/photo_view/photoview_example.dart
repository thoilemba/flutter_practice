import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';


class SimplePhotoView extends StatelessWidget {
  const SimplePhotoView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Zoomable Image'),
        ),
        body: Column(
          children: [
            // Center(
            //   child: PhotoView(
            //     imageProvider: const NetworkImage('https://picsum.photos/id/5/400/300'), // Replace with your image path
            //     minScale: PhotoViewComputedScale.contained,
            //     maxScale: PhotoViewComputedScale.covered * 2,
            //     backgroundDecoration: const BoxDecoration(
            //       color: Colors.black,
            //     ),
            //   ),
            // ),
            // Image.asset(
            //   'assets/maps/Map 1.jpg'
            // ),
            // Container(
            //   height: 200,
            //   width: 300,
            //   child: PhotoView(
            //     imageProvider: const AssetImage("assets/maps/Map 1.jpg"),
            //     minScale: PhotoViewComputedScale.contained,
            //     maxScale: PhotoViewComputedScale.covered * 2,
            //   ),
            // ),
            InteractiveViewer(
              // panEnabled: false, // Set it to false
              boundaryMargin: EdgeInsets.all(10),
              // minScale: 0.5,
              maxScale: 5,
              child: Image.network(
                'https://picsum.photos/id/1/400/300',
                // width: 200,
                // height: 200,
                fit: BoxFit.cover,
              ),
            ),
            // Container(
            //   height: 8,
            //   color: Colors.grey,
            // ),
            // InteractiveViewer(
            //   // panEnabled: false, // Set it to false
            //   boundaryMargin: EdgeInsets.all(10),
            //   // minScale: 0.5,
            //   maxScale: 5,
            //   child: Image.asset(
            //     'assets/maps/Map 2.jpg',
            //     // width: 200,
            //     // height: 200,
            //     fit: BoxFit.cover,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}


