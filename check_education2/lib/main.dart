import 'package:check_education2/inhNotiWidget.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(MaterialApp(home: Example()));
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ClikerWidget()),
    );
  }
}
class ClikerWidget extends StatefulWidget {
  const ClikerWidget({super.key});

  @override
  State<ClikerWidget> createState() => _ClikerWidgetState();
}

class _ClikerWidgetState extends State<ClikerWidget> {
  var _valueOne = 0;
  var _valueTwo = 0;
  void _incrimentOne(){
    setState(() {
      ++_valueOne;
    });
  }
  void _incrimentTwo(){
    setState(() {
      ++_valueTwo;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(onPressed: _incrimentOne, 
        child: const Text('Press me one')),
        ElevatedButton(onPressed: _incrimentTwo, 
        child: const Text('Press me two')),
        DateProviderInherired(valueOne: _valueOne,
        valueTwo: _valueTwo,
        child: const CounterWidget(),)
      ],
    );
  }
}
class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final value = context.dependOnInheritedWidgetOfExactType<DateProviderInherired>(aspect: 
    DataAspects.valueOne)?.valueOne ?? 0;
    return Column(
      children: [
        Text('$value'),
        const CounterWidgetTwo()
      ],
    );
  }
}
class CounterWidgetTwo extends StatelessWidget {
  const CounterWidgetTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final value = context.dependOnInheritedWidgetOfExactType<DateProviderInherired>(aspect: 
    DataAspects.valueTwo)?.valueTwo ?? 0;
    return Text('$value');
  }
}

class DateProviderInherired extends InheritedModel<DataAspects>{
  final int valueOne;
  final int valueTwo;
  const DateProviderInherired({super.key, required this.valueOne, required this.valueTwo, required super.child});
  
  
  @override
  bool updateShouldNotify(covariant DateProviderInherired oldWidget) {
    return valueOne != oldWidget.valueOne || valueTwo != oldWidget.valueTwo;
  }
  
  @override
  bool updateShouldNotifyDependent(
    covariant DateProviderInherired oldWidget, 
    Set<DataAspects> aspects) {
    final isValueOneUpdated = valueOne != oldWidget.valueOne && aspects.contains(DataAspects.valueOne);
    final isValueTwoUpdated = valueTwo != oldWidget.valueTwo && aspects.contains(DataAspects.valueTwo);
    return isValueOneUpdated || isValueTwoUpdated;
  }
  
 
}

enum DataAspects{
  valueOne,
  valueTwo
}