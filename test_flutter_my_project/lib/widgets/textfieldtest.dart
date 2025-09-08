import 'package:flutter/material.dart';

class Example extends StatelessWidget {
  const Example({super.key});

  void _onChanged(String text){
    print('_onChanged: $text');
  }
  void _onEditingComplete(){
    print('_onEditingComplete');
  }
  void _onSubmitted(String text){
    print('_onSubmitted: $text');
  }
  void _onTab(){
    print('_onTab');
  }
  void _onAppPrivateCommand(String text, Map<String, dynamic> arguments){
    print('_onAppPrivateCommand: $text');
    print('_onAppPrivateCommand: $arguments');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(padding: EdgeInsets.all(40),
        child: TextField(
          onChanged: _onChanged,
          onEditingComplete: _onEditingComplete,
          onSubmitted: _onSubmitted,
          onTap: _onTab,

          onAppPrivateCommand: _onAppPrivateCommand,
           
          textInputAction: TextInputAction.next, //вместо готово(enter) на клавиатуре будет next
          // autocorrect: true,
          // enableSuggestions: false,
          // keyboardType: TextInputType.number, //клавиатура будет только цифры
          maxLength: 15,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5)
            ),
            enabled: true
          ),
        ), 
        ),
      ),
    );
  }
}