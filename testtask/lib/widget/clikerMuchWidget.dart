import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _counter = 0;
  void _increaseCounter(){
    ++_counter;
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextCounter(),
            SizedBox(height: 30),
            IncreaseButton()
          ],
        ),
      ),
    );
  }
}

class TextCounter extends StatelessWidget {
  const TextCounter({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = context.findAncestorStateOfType<_AppState>()!._counter;
    return Text('$counter');
  }
}
class IncreaseButton extends StatelessWidget {
  const IncreaseButton({super.key});

  @override
  Widget build(BuildContext context) {
    final inc = context.findAncestorStateOfType<_AppState>()!._increaseCounter;
    return ElevatedButton(onPressed: inc, 
    child: Text('нажми'));
  }
}