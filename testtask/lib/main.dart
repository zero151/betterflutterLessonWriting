import 'package:flutter/material.dart';
import 'package:testtask/widget/clikerInheritWidget.dart';
import 'package:testtask/widget/clikerMuchWidget.dart';
import 'package:testtask/widget/clikerWidget.dart';
import 'package:testtask/widget/didUpdateWidget.dart';
import 'package:testtask/widget/sumInheritedNotifier.dart';
import 'package:testtask/widget/swapTextField.dart';
import 'package:testtask/widget/clickerInheritedMod.dart';
import 'package:testtask/widget/swapWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routes:  {
        '/swap': (context) => SwapWidegts(),
        '/did': (context) => DidUpdateWidget(),
        '/swapT': (context) => App(),
        '/inherit': (context) => ClikerInheritWidget(),
        '/inherit': (context) => ClikerInheritModWidget(),
        '/example': (context) => Example(),
      } ,
      initialRoute: '/example',
      debugShowCheckedModeBanner: false,
    );
  }
}

