import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {
  const CustomWidget({
    super.key,
    required this.title,
    required this.instructor,
    required this.numberOfChapters,
    required this.imageUrl,
  });

  final String title;
  final String instructor;
  final int numberOfChapters;
  final String imageUrl;


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(
        vertical: 9,
        horizontal: 5,
      ),
      child: Row(
        children: [
          // Thumbnail
          Flexible(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: AspectRatio(
                aspectRatio: 4/3,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Title of the Course
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    // softWrap: false,
                  ),
                  // Number of Chapters and Videos
                  Text(
                    numberOfChapters == 1
                        ?"$numberOfChapters Chapter"
                        :"$numberOfChapters Chapters",
                    style: const TextStyle(
                      // color: Colors.blue,
                      fontSize: 16,
                    ),
                  ),
                  // Instructor
                  Text(
                    "Instructor: $instructor",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 16,
                      // color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}