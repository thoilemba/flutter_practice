import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class MyLayoutGrid extends StatelessWidget {
  const MyLayoutGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutGrid(
      // areas: '''
      //   header header
      //   sidebar content,
      //   footer footer,
      // ''',
      columnSizes: [150.px, 2.fr],
      rowSizes: [250.px, flex(2), auto],
      children: [
        Container(
          color: Colors.orange,
          child: const Text(
            'This is a dummy text 1',
            style: kTextStyle,
          ),
        ),
        Container(
          color: Colors.green,
          child: const Text(
            'This is a dummy text 2',
            style: kTextStyle,
          ),
        ),
        Container(
          color: Colors.red,
          child: const Text(
            'This is a dummy text 3',
            style: kTextStyle,
          ),
        ),
        Container(
          color: Colors.yellow,
          child: const Text(
            'This is a dummy text 4',
            style: kTextStyle,
          ),
        ),
        Container(
          color: Colors.blue,
          child: const Text(
            'This is a dummy text 5',
            style: kTextStyle,
          ),
        ),
        Container(
          color: Colors.pink,
          child: const Text(
            'This is a dummy text 6',
            style: kTextStyle,
          ),
        ),
      ],
    );
  }
}

const kTextStyle = TextStyle(
  fontSize: 30,
);

List<Container> containerList(Color myColour) {
  return List.generate(
    6,
    (index) => Container(
      color: myColour,
      child: Text(
        'This is a dummy text $index',
        style: kTextStyle,
      ),
    ),
  );
}
