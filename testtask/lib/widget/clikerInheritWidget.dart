import 'package:flutter/material.dart';

class ClikerInheritWidget extends StatefulWidget {
  const ClikerInheritWidget({super.key});

  @override
  State<ClikerInheritWidget> createState() => _ClikerInheritWidgetState();
}

class _ClikerInheritWidgetState extends State<ClikerInheritWidget> {
  var value = 0;

  void _increaseCounter(){
    setState(() {
      ++value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: 
      Column(
        children: [
          ElevatedButton(onPressed: _increaseCounter, child: const Text('Нажми')),
          ElevatedButton(onPressed: (){setState(() {});}, child: const Text('1Нажми')),
          DataProviderInherited(value: value, 
          child: const DataConsumerStateless())
      ],)),
    );
  }
}
class DataConsumerStateless extends StatelessWidget {
  const DataConsumerStateless({super.key});

  @override
  Widget build(BuildContext context) {
    final value = context.dependOnInheritedWidgetOfExactType<DataProviderInherited>()?.value;
    return Column(
      children: [
        Text('$value'),
        const MyWidget()
      ],
    );
  }
}
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Text('qwqw');
  }
}

class DataProviderInherited extends InheritedWidget{
  final int value;
  
  const DataProviderInherited({required this.value, required super.child,});

  @override
  bool updateShouldNotify(DataProviderInherited oldWidget) {
    return value != oldWidget.value;
  }
  
}