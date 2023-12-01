import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fquery/fquery.dart';

// Post welcomeFromJson(String str) => Post.fromJson(json.decode(str));
//
// String welcomeToJson(Post data) => json.encode(data.toJson());

class Post {
  int userId;
  int id;
  String title;
  String body;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  // Deserialized - Converting JSON data into object, returning instance of the Post class
  factory Post.fromJson(Map<String, dynamic> json) => Post(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  // Serialized - Converting object to JSON data, returns a Map<String, dynamic> object.
  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}


Future<List<Post>> getPosts() async {
  final res = await Dio().get('https://jsonplaceholder.typicode.com/posts');
  return (res.data as List)
      .map((e) => Post.fromJson(e as Map<String, dynamic>))
      .toList();
}

class Posts extends HookWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final posts = useQuery(['posts'], getPosts);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Serialized using factory constructor'
        ),
      ),
      body: Builder(
        builder: (context) {
          // The query has no data to display
          if (posts.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          // An error has occurred
          if (posts.isError) {
            return Center(child: Text(posts.error!.toString()));
          }

          // Success, data is ready to display
          return ListView.builder(
            itemCount: posts.data!.length,
            itemBuilder: (context, index) {
              final post = posts.data![index];
              return ListTile(
                title: Text(post.title),
              );
            },
          );
        },
      ),
    );
  }
}