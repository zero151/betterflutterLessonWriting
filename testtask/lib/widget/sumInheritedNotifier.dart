import 'package:flutter/material.dart';

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: SimpleCalcWidget()),
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
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: SimpleCalcWidgetProvider(
          model: _model,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              FirstNumberWidget(),
              SizedBox(height: 10),
              SecondNumberWidget(),
              SizedBox(height: 10),
              SumButtonWidget(),
              SizedBox(height: 10),
              ResultWidget(),
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
      decoration: const InputDecoration(border: OutlineInputBorder()),
      onChanged: (value) {
        final model = SimpleCalcWidgetProvider.of(context);
        model?.firstNumber = value;
      },
    );
  }
}

class SecondNumberWidget extends StatelessWidget {
  const SecondNumberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(border: OutlineInputBorder()),
      onChanged: (value) {
        final model = SimpleCalcWidgetProvider.of(context);
        model?.secondNumber = value;
      },
    );
  }
}

class SumButtonWidget extends StatelessWidget {
  const SumButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final model = SimpleCalcWidgetProvider.of(context);
        model?.sum();
      },
      child: const Text('Посчитать сумму'),
    );
  }
}

class ResultWidget extends StatelessWidget {
  const ResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final result = SimpleCalcWidgetProvider.of(context)?.sumResult ?? 'Введите числа';
    return Text('Результат: $result', style: TextStyle(fontSize: 18));
  }
}

class SimpleCalcWidgetModel extends ChangeNotifier {
  int? _firstNumber;
  int? _secondNumber;
  int? _sumResult; // renamed to avoid confusion

  set firstNumber(String value) {
    final parsed = int.tryParse(value);
    if (_firstNumber != parsed) {
      _firstNumber = parsed;
    }
  }

  set secondNumber(String value) {
    final parsed = int.tryParse(value);
    if (_secondNumber != parsed) {
      _secondNumber = parsed;
    }
  }

  int? get sumResult => _sumResult;

  void _updateSum() {
    final result = (_firstNumber != null && _secondNumber != null)
        ? _firstNumber! + _secondNumber!
        : null;

    if (_sumResult != result) {
      _sumResult = result;
      notifyListeners();
    }
  }

  void sum() => _updateSum(); // just triggers recalc
}

class SimpleCalcWidgetProvider extends InheritedNotifier<SimpleCalcWidgetModel> {
  final SimpleCalcWidgetModel model;

  const SimpleCalcWidgetProvider({
    required this.model,
    required Widget child,
  }) : super(notifier: model, child: child);

  static SimpleCalcWidgetModel? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<SimpleCalcWidgetProvider>()
        ?.model;
  }
}