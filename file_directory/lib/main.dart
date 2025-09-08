import 'package:file_directory/example_model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter file',
      home: const __ExampleWidget(),
    );
  }
}

class __ExampleWidget extends StatefulWidget {
  const __ExampleWidget({super.key});

  @override
  State<__ExampleWidget> createState() => __ExampleWidgetState();
}

class __ExampleWidgetState extends State<__ExampleWidget> {
  final model = ExampleWidgetModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ExampleModelProvider(
            model: model, 
            child: Column(
              children: [
                const _ReadFileBuuton()
              ],
            )),
        )),
    );
  }
}

class _ReadFileBuuton extends StatefulWidget {
  const _ReadFileBuuton({super.key});

  @override
  State<_ReadFileBuuton> createState() => __ReadFileBuutonState();
}

class __ReadFileBuutonState extends State<_ReadFileBuuton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ExampleModelProvider.read(context)!.model.readFile, 
      child: const Text('Прочитать файл'));
  }
}