import 'package:flutter/material.dart';
import 'layout_grid.dart';
import 'listview_builder_example.dart';

class LayoutListViewExample extends StatelessWidget {
  const LayoutListViewExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'LayoutGrid and ListView Example',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return const LayoutGridExample();
                }));
              },
              child: const Text('Go to LayoutGrid Example'),
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return const ListViewBuilderExample();
                }));
              },
              child: const Text('Go to ListView Example'),
            ),
          ],
        ),
      ),
    );
  }
}
