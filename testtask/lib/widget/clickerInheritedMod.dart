import 'package:flutter/material.dart';

class ClikerInheritModWidget extends StatefulWidget {
  const ClikerInheritModWidget({super.key});

  @override
  State<ClikerInheritModWidget> createState() => _ClikerInheritWidgetState();
}

class _ClikerInheritWidgetState extends State<ClikerInheritModWidget> {
  var valueOne = 0;
  var valueTwo = 0;

  void _increaseCounterOne(){
    setState(() {
      ++valueOne;
    });
  }
  void _increaseCounterTwo(){
    setState(() {
      ++valueTwo;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: 
      Column(
        children: [
          ElevatedButton(onPressed: _increaseCounterOne, child: const Text('Нажми 1')),
          ElevatedButton(onPressed: _increaseCounterTwo, child: const Text('Нажми 2')),
          DataProviderInherited(valueOne: valueOne,
           valueTwo: valueTwo,
          child: const DataConsumerStateless())
      ],)),
    );
  }
}
class DataConsumerStateless extends StatelessWidget {
  const DataConsumerStateless({super.key});

  @override
  Widget build(BuildContext context) {
    final value = context.dependOnInheritedWidgetOfExactType<DataProviderInherited>(aspect: 'one')?.valueOne;
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
    final value = context.dependOnInheritedWidgetOfExactType<DataProviderInherited>(aspect: 'two')?.valueTwo;
    return Text('$value');
  }
}

class DataProviderInherited extends InheritedModel{
  final int valueOne;
  final int valueTwo;
  
  const DataProviderInherited({required this.valueOne, required this.valueTwo, required super.child,});

  @override
  bool updateShouldNotify(DataProviderInherited oldWidget) {
    return valueOne != oldWidget.valueOne || valueTwo != oldWidget.valueTwo;
  }
  
  @override
  bool updateShouldNotifyDependent(covariant DataProviderInherited oldWidget, Set<Object?> aspects) {
    final isvalueOneUpdated = valueOne != oldWidget.valueOne && aspects.contains('one');
    final isvalueTwoUpdated = valueTwo != oldWidget.valueTwo && aspects.contains('two');
    return isvalueOneUpdated || isvalueTwoUpdated;
  }
  
}