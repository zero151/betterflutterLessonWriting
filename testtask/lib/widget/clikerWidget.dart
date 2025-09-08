import 'package:flutter/material.dart';

class ClikerWidget extends StatefulWidget {
  const ClikerWidget({super.key});

  @override
  State<ClikerWidget> createState() => _ClikerWidgetState();
}

class _ClikerWidgetState extends State<ClikerWidget> {
  var _counter = 0;
  void _increaseCounter() {
    setState(() => _counter++);
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Счётчик: $_counter'),
        duration: Duration(seconds: 2),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('$_counter'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: _increaseCounter, child: Icon(Icons.add),),
    );
    
  }
}