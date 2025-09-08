import 'dart:math';

import 'package:flutter/material.dart';

class SwapWidegts extends StatefulWidget {
  const SwapWidegts({super.key});

  @override
  State<SwapWidegts> createState() => _SwapWidegtsState();
}

class _SwapWidegtsState extends State<SwapWidegts> {
  List<Widget> titles = [
    ColorTitle(key: UniqueKey()),
    ColorTitle(key: UniqueKey()),
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
            children: titles,
          )
        ],
      ),
    );
  }
}
class ColorTitle extends StatefulWidget {
  ColorTitle({super.key});
  @override
  State<ColorTitle> createState() => _ColorTitleState();
}

class _ColorTitleState extends State<ColorTitle> {
  
  final myColor = UniqueColorGenerator.getColor();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: myColor
    );
  }
}
class UniqueColorGenerator{
  static final _random = Random();
  static Color getColor(){
    return Color.fromRGBO(
      _random.nextInt(256),
      _random.nextInt(256), 
      _random.nextInt(256), 1.0);
  }
}
