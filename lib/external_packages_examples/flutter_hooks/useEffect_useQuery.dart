import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fquery/fquery.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


/*
  Used this class in the main like this by using QueryClientProvider

  void main() {
  var queryClient = QueryClient();
  runApp(
      QueryClientProvider(
        queryClient: queryClient,
        child: const MyApp(),
      )
  );
}

class MyApp extends HookWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Test()
    );
  }
}
 */

class UseEffectUseQueryExample extends HookWidget {
  UseEffectUseQueryExample({Key? key}) : super(key: key);

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

    final todo = useQuery(['todolist'], () => fetchData(updatedValue), refetchOnMount: RefetchOnMount.always);

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
              _mainController.changeValue(Random().nextInt(100));
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


class MainController extends GetxController {

  RxInt count = 1.obs; // state variable

  // changing the state variable and updating
  void changeValue(int index) {
    count.value = index;
    update();

    if (kDebugMode) {
      print(count.value);
    }
  }
}