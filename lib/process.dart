import 'dart:convert';

import 'package:http/http.dart' as http;
import 'post.dart';


//Get
Future<Post> fetchPost() async{
  final uri = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
  final response = await http.get(uri);

  if(response.statusCode == 200){
    return Post.fromJson(json.decode(response.body));
  }else{
    throw Exception('failed to load post');
  }
}
// post
Future<Post> createPost(String userName, String userPass) async {
  Map<String, dynamic> request = {
    'userName': userName,
    'userPass': userPass
  };

  final uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  final response = await http.post(uri, body: request);

  if(response.statusCode == 201){
    return Post.fromJson(json.decode(response.body));
  }else{
    throw Exception('Failed to load post');
  }
}