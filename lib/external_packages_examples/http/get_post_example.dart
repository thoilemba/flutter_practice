import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetPostExample extends StatefulWidget {
  const GetPostExample({super.key});

  @override
  State<GetPostExample> createState() => _GetPostExampleState();
}

class _GetPostExampleState extends State<GetPostExample> {

  int? fetchResponseStatusCode;
  Map fetchResponseData = {};

  int? postResponseStatusCode;
  Map postResponseData = {};

  void fetchData() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response, then parse the JSON.
      if (kDebugMode) {
        print(response.body);
      }

      setState(() {
        fetchResponseData = jsonDecode(response.body);
        fetchResponseStatusCode = response.statusCode;
      });
    } else {
      // If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to load data');
    }
  }

  void postData() async {
    try{
      String url = "https://jsonplaceholder.typicode.com/posts";

      var response = await http.post(
          Uri.parse(url),
          body: {
            'name': 'Thoilemba',
            'email': 'thoi@email.com'
          }
      );

      if (kDebugMode) {
        print(response.body);
      }

      setState(() {
        postResponseStatusCode = response.statusCode;
        postResponseData = jsonDecode(response.body);
      });
    }catch(e){
      if (kDebugMode) {
        print("Something went wrong: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Http Example"),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Flutter Practice',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: fetchData,
                  child: const Text('Fetch data'),
                ),
                ElevatedButton(
                  onPressed: postData,
                  child: const Text('Post data'),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Fetch status code : $fetchResponseStatusCode',
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold
              ),
            ),
            if(fetchResponseData.isNotEmpty)
              Text(
                fetchResponseData.toString(),
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                ),
              ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Post status code : $postResponseStatusCode',
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold
              ),
            ),
            if(postResponseData.isNotEmpty)
              Text(
                postResponseData.toString(),
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                ),
              ),
          ],
        ),
      ),
    );
  }
}
