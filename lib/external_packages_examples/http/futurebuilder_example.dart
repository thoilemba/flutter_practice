import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FutureBuilderExample extends StatelessWidget {
  const FutureBuilderExample({super.key});

  Future<Map<String, dynamic>> fetchData() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body); // Parse the response data
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fetched Data'
        )
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While waiting for the data to load, show a loading indicator
            return const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Fetching data"),
                SizedBox(
                  width: 20,
                ),
                CircularProgressIndicator(),
              ],
            );
          } else if (snapshot.hasError) {
            // If there's an error, show an error message
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // If the data is loaded, display the ListView
            final Map<String, dynamic> fetchedData = snapshot.data!;
            return ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(fetchedData.toString()),
                );
              },
            );
          }
        },
      ),
    );
  }
}
