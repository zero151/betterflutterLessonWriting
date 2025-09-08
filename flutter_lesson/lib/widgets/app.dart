import 'package:flutter/material.dart';
import 'package:flutter_lesson/widgets/test2.dart';
import 'package:flutter_lesson/widgets/testMecanic.dart';
import 'package:flutter_lesson/widgets/themoviedb.dart';
import 'package:flutter_lesson/widgets/user_profile.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Test());
  }
}