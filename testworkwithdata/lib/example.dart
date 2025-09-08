import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:testworkwithdata/example_data.dart';
import 'package:testworkwithdata/human.dart';

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: JsonExampleProvider(
          coder: JsonExampleCoder(),
          child: const ButtonsWidget())),
    );
  }
}

class ButtonsWidget extends StatelessWidget {
  const ButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () => JsonExampleProvider.read(context)?.coder.encode(), child: Text('Кодировать')),
          ElevatedButton(
            onPressed: () => JsonExampleProvider.read(context)?.coder.decode(), child: Text('Декодировать'))
        ],
      )
    );
  }
} 
class JsonExampleProvider extends InheritedWidget{
  final JsonExampleCoder coder;

  const JsonExampleProvider({super.key, required this.coder, required super.child});

  static JsonExampleProvider? watch(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<JsonExampleProvider>();
  }

  static JsonExampleProvider? read(BuildContext context){
    final widget = context
      .getElementForInheritedWidgetOfExactType<JsonExampleProvider>()?.widget;
      return widget is JsonExampleProvider ? widget : null;
  }
  
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

class JsonExampleCoder{
  void encode(){
    final objects = humans.map( (e) => e.toJson()).toList();
    final jsonString = jsonEncode(objects);
    print(jsonString);
  }
  void decode(){
    final json = jsonDecode(jsonStringg) as List<dynamic>;
    final humans = json
      .map((dynamic e) => Human.fromJson(e as Map<String, dynamic>))
      .toList();
    print(humans);

  } 
}