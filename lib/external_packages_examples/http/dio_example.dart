import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class DioExample extends StatefulWidget {
  const DioExample({super.key});

  @override
  State<DioExample> createState() => _DioExampleState();
}

class _DioExampleState extends State<DioExample> {

  final dio = Dio();

  int? fetchResponseStatusCode;
  Map fetchResponseData = {};

  int? postResponseStatusCode;
  Map postResponseData = {};

  void fetchData() async {
    final response = await dio.get('https://jsonplaceholder.typicode.com/todos/1');

    if (kDebugMode) {
      print(response);
    }

    setState(() {
      fetchResponseData = response.data;
      fetchResponseStatusCode = response.statusCode;
    });
  }

  void postData() async {
    String url = "https://jsonplaceholder.typicode.com/posts";

    var response = await dio.post(
      url,
      data: {
        'name': 'Thoilemba',
        'email': 'thoi@email.com'
      }
    );

    if (kDebugMode) {
      print(response);
    }

    setState(() {
      postResponseStatusCode = response.statusCode;
      postResponseData = response.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dio Package Example"),
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
