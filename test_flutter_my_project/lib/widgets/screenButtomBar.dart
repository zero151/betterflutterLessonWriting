import 'package:flutter/material.dart';

class ButtomBar extends StatefulWidget {
  const ButtomBar({super.key});

  @override
  State<ButtomBar> createState() => _ButtomBarState();
}

class _ButtomBarState extends State<ButtomBar> {
  int _countItem = 0;
  void onTap(int index){
    setState(() {
      _countItem = index;
    });
  }
  final _widgetList = <Widget>[
    Text('Фильм'),
    Text('Языки')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amber,
        selectedItemColor: Colors.red,
        currentIndex: _countItem,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'Фильм'),
          BottomNavigationBarItem(
            icon: Icon(Icons.language),
            label: 'Языки')
        ],
        onTap: onTap,
        ),
        body: Center(
          child: _widgetList[_countItem],
        ),
    );
  }
}