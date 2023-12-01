import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'custom_widget.dart';


class LayoutGridExample extends HookWidget {
  const LayoutGridExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'LayoutGrid Example'
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
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: LayoutGrid(
                  columnSizes: [0.2.fr],
                  rowSizes: List.generate(
                    7,
                    (index) => auto,
                  ),
                  rowGap: 12,
                  children: List.generate(
                    7,
                    (index) {
                      return const CustomWidget(
                        title: 'This is a long title to test the overflow when using on different screen sizes',
                        instructor: 'Myself',
                        numberOfChapters: 5,
                        imageUrl: 'https://picsum.photos/200/300',
                      );
                    } ,
                  ),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
