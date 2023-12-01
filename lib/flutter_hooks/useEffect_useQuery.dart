import 'package:dio/dio.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fquery/fquery.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../controller.dart';



class Test extends HookWidget {
  Test({Key? key}) : super(key: key);

  final MainController _mainController = Get.put(MainController());
  final dio = Dio();

  Future<String> fetchData(int index) async {
    final response = await dio.get('https://jsonplaceholder.typicode.com/todos/$index');
      var data = response.data;
      var res = data["title"];

      if (kDebugMode) {
        print(data);
      }

      return res;
  }

  @override
  Widget build(BuildContext context) {

    var updatedValue = _mainController.count.value;

    final todo = useQuery(['todolist'],
            () => fetchData(updatedValue),
        refetchOnMount: RefetchOnMount.always);

    useEffect(() {
      final subscription = _mainController.count.listen((data) {
        updatedValue = data;

        if (context.mounted) {
          todo.refetch();
        }
      });

      return () {
        subscription.cancel();
      };
    }, []);

    if (todo.isLoading) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    if (todo.isError) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Scaffold(
          body: Center(
            child: Text(
              todo.error.toString(),
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'useQuery Example'
        ),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              _mainController.changeValue(2);
            },
            child: const Text('Change'),
          ),
          Center(
            child: Text(
              todo.data.toString(),
              style: const TextStyle(
                fontSize: 22,
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}