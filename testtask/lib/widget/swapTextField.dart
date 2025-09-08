import 'dart:math';

import 'package:flutter/material.dart';

class SwapTextFWidegts extends StatefulWidget {
  const SwapTextFWidegts({super.key});

  @override
  State<SwapTextFWidegts> createState() => _SwapTextFWidegtsState();
}

class _SwapTextFWidegtsState extends State<SwapTextFWidegts> {
  List<Widget> titles = [
    _textfieldwidgetState(key: UniqueKey()),
    _textfieldwidgetState(key: UniqueKey()),
  ];

  void swapTitles(){
    setState(() {
      titles.insert(1, titles.removeAt(0));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: swapTitles, child: Text('Toggle')),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: titles,
          )
        ],
      ),
    );
  }
}
class _textfieldwidgetState extends StatefulWidget {
  const _textfieldwidgetState({super.key});

  @override
  State<_textfieldwidgetState> createState() => __textfieldwidgetStateState();
}

class __textfieldwidgetStateState extends State<_textfieldwidgetState> {
  final controller = TextEditingController();  
  var text = '';
  @override
  void initState() {
    super.initState();
    controller.addListener((){ text = controller.text;
    setState(() {
      
    });});
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100, 
      child: Column(
        children: [
          TextField(controller: controller,),
          Text(text,
           overflow: TextOverflow.ellipsis,
           maxLines: 3,)
        ],
      ));
  }
}