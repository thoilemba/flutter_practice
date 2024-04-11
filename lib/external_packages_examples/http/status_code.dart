import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StatusCode extends StatelessWidget {
  const StatusCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('HTTP Error Handling Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              // Make an HTTP GET request to a dummy API endpoint
              var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

              // Check the status code of the response
              if (response.statusCode == 200) {
                // The request was successful
                // Parse the JSON data from the response body
                var data = jsonDecode(response.body);
                print(data);
                // Show a success message with the data
                //     Container(
                //       color: Colors.green,
                //       child: Text('Success! The title of the post is: ${data['title']}'),
                //     );

              } else {
                // The request was not successful
                // Show an error message based on the status code
                String message = '';
                switch (response.statusCode) {
                  case 400:
                    message = 'Bad Request';
                    break;
                  case 401:
                    message = 'Unauthorized';
                    break;
                  case 403:
                    message = 'Forbidden';
                    break;
                  case 404:
                    message = 'Not Found';
                    break;
                  case 500:
                    message = 'Internal Server Error';
                    break;
                  default:
                    message = 'Something went wrong';
                    break;
                }
                print('Error! The status code is: ${response.statusCode} ($message)');
                Container(
                  color: Colors.red,
                  child: Text('Error! The status code is: ${response.statusCode} ($message)'),
                );
              }
            },
            child: const Text('Make a request'),
          ),
        ),
      ),
    );
  }
}
