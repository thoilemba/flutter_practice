import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'custom_widget.dart';

class ListViewBuilderExample extends HookWidget {
  const ListViewBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ListView Example',
        ),
      ),
      body: Container(
          alignment: Alignment.topCenter,
          // height: 400,
          color: const Color.fromARGB(255, 238, 238, 238),
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.white,
                height: 40,
                width: double.infinity,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Courses",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Expanded(
                child: ListView.builder(
                  // scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 6.0),
                      // child: SizedBox(
                      //   height: 120,
                        /*
                          This parent widget must have a finite size in order to used
                          the mainAxisAlignment: MainAxisAlignment.spaceBetween property
                        */
                        child: CustomWidget(
                          title: 'This is a long title to test the overflow when using on different screen sizes',
                          instructor: 'Myself',
                          numberOfChapters: 5,
                          imageUrl: 'https://picsum.photos/300/200',
                        ),
                      // ),
                    );
                  },
                ),
              ),
            ],
          ),
      ),
    );
  }
}





