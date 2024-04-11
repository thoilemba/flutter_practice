import 'dart:developer';
import 'package:flutter/material.dart';

class AspectRatioExample extends StatelessWidget {
  const AspectRatioExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    log("Width*Height: $width*$height");

    var myHeight = MediaQuery.of(context).size.height * 0.35;

    // tablet : 1232/800 = 1.54
    // normal : 866.28/411.42 = 2.10
    // small : 533.33/320 = 1.66
    // my physical : 834.90/392.72 = 2.12

    if((height / width) < 2){
      myHeight = MediaQuery.of(context).size.height * 0.45;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive design with aspect ratio'),
      ),
      // backgroundColor: Colors.blue,
      body: Container(
        margin: const EdgeInsets.only(top: 8),
        color: Colors.grey,
        height: myHeight,
        child: Padding(
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6.0),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    // padding: const EdgeInsets.only(top: 4),
                    color: Colors.green,
                    child: Image.network(
                      "https://picsum.photos/id/0/1920/1080",
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Title 1',
                style: TextStyle(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

