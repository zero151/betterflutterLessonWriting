import 'dart:convert';
import 'dart:io';

import 'package:http_reqest/domain/entity/post.dart';

/*
Сначала всё приходит в байтах 
и мы переводим в текст и склеиваем все куски(join)
*/

class ApiClient {
  final client = HttpClient();
   
  Future<List<Post>> getPosts() async {
    final json = await _get('https://jsonplaceholder.typicode.com/posts') as List<dynamic>;
    final List<Post> posts = json.map((e) => Post.fromJson(e as Map<String, dynamic>)).toList();

    return posts;
  }

  Future<dynamic> _get(String urlString) async{
    final url = Uri.parse(urlString); 

    final request = await client.getUrl(url);

    // Добавляем важные заголовки
    request.headers
    ..set('User-Agent', 'Mozilla/5.0 (Linux; Android 10; Mobile) AppleWebKit/537.36')
    ..set('Accept', 'application/json')
    ..set('Accept-Encoding', 'gzip');

    final response = await request.close();

    if (response.statusCode != 200) {
      throw Exception('Ошибка загрузки данных: ${response.statusCode}');
    }

    final jsonStrings = await response.transform(utf8.decoder).toList();
    final jsonString = jsonStrings.join();
    final dynamic json = jsonDecode(jsonString);
    return json;
  }

  Future<Post> createPost({required String title, required String body}) async{
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final parameters = <String, dynamic>{
      'title': title,
      'body': body,
      'userId': 109
    };
    final request = await client.postUrl(url);
    request.headers.set('Content-type', 'application/json; charset=UTF-8');
    request.write(jsonEncode(parameters));
    final response = await request.close();

    final jsonStrings = await response.transform(utf8.decoder).toList();
    final jsonString = jsonStrings.join();
    final json = jsonDecode(jsonString) as Map<String, dynamic>;
    final post = Post.fromJson(json);
    return post;
  }

  void close() {
    client.close();
  } 
}