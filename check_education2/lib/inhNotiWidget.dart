import 'package:flutter/material.dart';

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: SimpleCalcWidget(),)

    );
  }
}
class SimpleCalcWidget extends StatefulWidget {
  const SimpleCalcWidget({super.key});

  @override
  State<SimpleCalcWidget> createState() => _SimpleCalcWidgetState();
}

class _SimpleCalcWidgetState extends State<SimpleCalcWidget> {
  final _model = SimpleCalcWidgetModel();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: SimpleCalcWidgetProvider(
          model: _model,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const[
               FirstNumberWidget(),
               SizedBox(height: 10),
               SecondNumberWidget(),
               SizedBox(height: 10),
               SumNumbersWidget(),
               SizedBox(height: 10),
               ResultWidget()
              
            ],
          ),
        ),
      ),
    );
  }
}
class FirstNumberWidget extends StatelessWidget {
  const FirstNumberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(border: OutlineInputBorder()),
      keyboardType: TextInputType.number,
      onChanged: (value) {
        SimpleCalcWidgetProvider.of(context)?.FirstNumber = value;
      },
    );
  }
}
class SecondNumberWidget extends StatelessWidget {
  const SecondNumberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(border: OutlineInputBorder()),
      keyboardType: TextInputType.number,
      onChanged: (value) {
        SimpleCalcWidgetProvider.of(context)?.SecondNumber = value;
      },
    );
  }
}
class SumNumbersWidget extends StatelessWidget {
  const SumNumbersWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      SimpleCalcWidgetProvider.of(context)?.Sum();
    }, child: const Text('Посчитать'));
  }
}
class ResultWidget extends StatelessWidget {
  const ResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final result = SimpleCalcWidgetProvider.of(context)?.result ?? 'Введите числа для сложения';
    return Text('$result', style:  TextStyle(fontSize: 18),);
  }
}
class SimpleCalcWidgetModel extends ChangeNotifier{
  int? _firstNumber;
  int? _secondNumber;
  int? _result;
  set FirstNumber(String number){
    final parsed = int.tryParse(number);
    if (_firstNumber != parsed) {
      _firstNumber = parsed;
    }
  }
  set SecondNumber(String number){
    final parsed = int.tryParse(number);
    if (_secondNumber != parsed) {
      _secondNumber = parsed;
    }
  }
  int? get result => _result;

  void Sum(){
    final result = (_firstNumber != null && _secondNumber != null)
        ? _firstNumber! + _secondNumber!
        : null;

    if (_result != result) {
      _result = result;
      notifyListeners();
    }
  }

}
class SimpleCalcWidgetProvider extends InheritedNotifier<SimpleCalcWidgetModel>{
  final SimpleCalcWidgetModel model;
  SimpleCalcWidgetProvider({required this.model, required super.child}) : super(notifier: model);

  static SimpleCalcWidgetModel? of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<SimpleCalcWidgetProvider>()?.model;
  }
  
}