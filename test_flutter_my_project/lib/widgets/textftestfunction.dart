import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Examplee extends StatefulWidget {
  Examplee({super.key});

  @override
  State<Examplee> createState() => _ExampleeState();
}

class _ExampleeState extends State<Examplee> {
  final controllerOne = TextEditingController();
  final nodeOne = FocusNode();
  final nodeTwo = FocusNode();

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

  void _onButtonTabController(){
    controllerOne.value = TextEditingValue(
      text: controllerOne.text.toString(),
      selection: TextSelection(baseOffset: 0, extentOffset: 9)
    ); 
  }

  void _onButtonTabNode(){
    nodeOne.addListener((){
      print(nodeOne.hasFocus);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(padding: EdgeInsets.all(40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              // focusNode: nodeOne,
              textInputAction: TextInputAction.next,
              // controller: controllerOne,
              // onChanged: _onChanged,
              // onEditingComplete: _onEditingComplete,
              // onSubmitted: _onSubmitted,
              // onTap: _onTab,
              inputFormatters: [PhoneInputFormatter()],
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amberAccent)
                )
              ),
            
            ),
            SizedBox(height: 40,),
            TextField(
              textInputAction: TextInputAction.next,
              // focusNode: nodeTwo,
              // controller: controllerOne,
              // onChanged: _onChanged,
              // onEditingComplete: _onEditingComplete,
              // onSubmitted: _onSubmitted,
              // onTap: _onTab,
            
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amberAccent)
                )
              ),
            
            ),

          ],
        ), 
        ),
      ),
    );
  }
}


class PhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue, 
    TextEditingValue newValue) {
      final digitOnly = newValue.text.replaceAll(RegExp(r'[^\d]+'), '');
      final initialSpeshialSimbolColunt = newValue.selection
        .textBefore(newValue.text)
        .replaceAll(RegExp(r'[\d]+'), '').length;
      final cursorPostition = 
        newValue.selection.start - initialSpeshialSimbolColunt;
      var finalCursorPostition = cursorPostition; 
      final digitOnlyChars = digitOnly.split('');

      if (oldValue.selection.textInside(oldValue.text) == ' '){
        digitOnlyChars.removeAt(cursorPostition - 1);
        finalCursorPostition -= 2;  
      }

      var newString = <String>[];
      for(var i = 0; i < digitOnlyChars.length; i++){
        if(i == 3 || i == 6 || i == 8){
          newString.add(' ');
          newString.add(digitOnlyChars[i]);
          if(i <= cursorPostition) finalCursorPostition += 1;
        }else{
          newString.add(digitOnlyChars[i]);
        }
      }

      final resultString = newString.join('');

      return TextEditingValue(
        text: resultString,
        selection: TextSelection.collapsed(offset: finalCursorPostition)
      );
  }

}