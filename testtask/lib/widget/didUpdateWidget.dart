// ignore: file_names
import 'package:flutter/material.dart';

class DidUpdateWidget extends StatefulWidget {
  DidUpdateWidget({super.key});

  @override
  State<DidUpdateWidget> createState() => _DidUpdateWidgetState();
}

class _DidUpdateWidgetState extends State<DidUpdateWidget> {
  String _name = 'Максим';

  void changingName(){
    setState(() {
      _name = _name == 'Максим' ? 'Егор' : 'Максим';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            UserCounter(name: _name),
            ElevatedButton(onPressed: changingName, 
            child: Text('Изменить имя на ${_name == 'Максим' ? 'Егор' : 'Максим'}'))

          ],
        ),
      ),
    );
  }
}

class UserCounter extends StatefulWidget {
  final String name;
  const UserCounter({super.key, required this.name});

  @override
  State<UserCounter> createState() => _UserCounterState();
}

class _UserCounterState extends State<UserCounter> {
  var _counter = 0;

  void _increaseCounter(){
    setState(() {
      ++_counter;
    });
  }

  @override
  void didUpdateWidget(covariant UserCounter oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(oldWidget.name != widget.name){
      _counter = 0;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(widget.name),
        Text('$_counter'),
        const SizedBox(height: 20),
        ElevatedButton(onPressed: _increaseCounter, child: Text('Увеличить счётчик на 1')),
      ],
    );
  }
}