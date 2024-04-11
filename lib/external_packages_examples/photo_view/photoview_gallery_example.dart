import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoviewGalleryExample extends StatefulWidget {
  const PhotoviewGalleryExample({Key? key}) : super(key: key);

  @override
  State<PhotoviewGalleryExample> createState() => _PhotoviewGalleryExampleState();
}

class _PhotoviewGalleryExampleState extends State<PhotoviewGalleryExample> {
  final _pageController = PageController();

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    // Listen to page changes and update the current index
    _pageController.addListener(() {
      final int currentIndex = _pageController.page?.round() ?? 0;
      if (currentIndex != _currentIndex) {
        setState(() {
          _currentIndex = currentIndex;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'PhotoviewGallery Example',
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          const Center(
            child: Text(
              'List of Photos',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            flex: 3,
            child: PhotoViewGallery.builder(
              itemCount: 4, // Replace with the number of images in your gallery
              builder: (context, index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: NetworkImage('https://picsum.photos/id/$index/400/300'), // Replace with your image path
                  minScale: PhotoViewComputedScale.contained,
                  maxScale: PhotoViewComputedScale.covered * 4,
                );
              },
              backgroundDecoration: const BoxDecoration(
                // color: Colors.black,
              ),
              pageController: _pageController, // You can use your own PageController
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: Text(
              '(${_currentIndex + 1}/4)',
              style: const TextStyle(
              ),
            ),
          ),
        ],
      ),
    );
  }
}


