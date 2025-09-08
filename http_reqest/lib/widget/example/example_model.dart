import 'package:flutter/material.dart';
import 'package:http_reqest/domain/api_clients/api_client.dart';
import 'package:http_reqest/domain/entity/post.dart';

class ExampleWidgetModel extends ChangeNotifier{
  final apiClient = ApiClient();
  var _posts = <Post>[];
  List<Post> get posts => _posts;

  void reloadPosts() async{
    final posts = await apiClient.getPosts();
    _posts += posts;
    notifyListeners();
  }

  void createPost() async{
    final posts = await apiClient.createPost(
    title: 'fegeg', 
    body: 'table');
  }
}


class ExampleModelProvider extends InheritedNotifier{
  final ExampleWidgetModel model;

  const ExampleModelProvider({super.key,required this.model, required super.child}):super(notifier: model);

  static ExampleModelProvider? watch(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<ExampleModelProvider>();
  }

  static ExampleModelProvider? read(BuildContext context){
    final widget = context
      .getElementForInheritedWidgetOfExactType<ExampleModelProvider>()?.widget;
    return widget is ExampleModelProvider ? widget : null;
  }
  
}