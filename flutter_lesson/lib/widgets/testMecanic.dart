import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  String text = 'Ни одна кнопка не нажата';
  bool _showfirst = true;
  void pringPress(){
    setState(() {
      text = 'Нажата первая или вторая кнопка';
    });
    
  }
  void pringPress3(){
    setState(() { 
      text = 'Нажата 3 кнопка';
    });
    
  }
  void pringPressLast(){
    setState(() {
      _showfirst = !_showfirst;
    });
  }
  void pringPressLost(){
    setState(() {
      text = 'Одна из кнопок была нажата';
    });
  }

  @override
  Widget build(BuildContext context) {
      final style = ButtonStyle(
                // backgroundColor: MaterialStateProperty.all(Colors.grey),
                // foregroundColor: MaterialStateProperty.all(Colors.green),
                // overlayColor: MaterialStateProperty.all(Colors.purple),
                // padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal:0)),
                // shape: MaterialStateProperty.all(
                //   RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(50.0),
                //     side: BorderSide(color: Colors.black)
                //   )
                // )
              );
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _showfirst ? MyWidget2(text: text) : MyWidget1(),
            ElevatedButton(
              clipBehavior: Clip.hardEdge,
              style: style,
              onLongPress: pringPressLost,
              onPressed: pringPress, 
            child: Text('Press me')),
            OutlinedButton(onPressed: pringPress, 
            onLongPress: pringPressLost,
            child: Text('Press me')),
            TextButton(onPressed:pringPress3, 
            onLongPress: pringPressLost,
            child: Text('Press me')),
            IconButton(
              splashRadius: 300,
              color: Colors.blue,
              isSelected: true,
              disabledColor: Colors.pink,
              highlightColor: Colors.red.withOpacity(0.3),
              onLongPress: pringPressLost,
              onPressed: null, 
              icon: Icon(Icons.ac_unit))
          ],
        ),
      ),
    );
  }
}

class MyWidget1 extends StatelessWidget {
  const MyWidget1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Вот и нахуй ты меняешь интерфейс?'),
        Container(
          width: 100,
          height: 100,
          color: Colors.red
        )
      ],
    );
  }
}
class MyWidget2 extends StatelessWidget {
  final String text;
  const MyWidget2({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text(text), Icon(Icons.cookie)],);
  }
}
// class TwoString{
//   final String text1;
//   final String text2;

//   TwoString({required this.text1, required this.text2});

// }


// class Exemple extends StatelessWidget {
//   final List<TwoString> textData = [
//     TwoString(text1: '1Left', text2: '1Right'),
//     TwoString(text1: '2Left', text2: '2Right'),
//     TwoString(text1: '3Left', text2: '3Right'),
//     TwoString(text1: '4Left', text2: '4Right'),
//     TwoString(text1: '5Left', text2: '5Right')];
//   Exemple({super.key});
  

//   @override
//   Widget build(BuildContext context) {
//     final List<Widget> data = textData.map((TwoString twoText) => Test(text: twoText)).toList();
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: data,
//       ),
//     );
//   }
// }
// class Test extends StatelessWidget {
//   final TwoString text;
//   const Test({super.key, required this.text});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15),
//       child: Row(children: [
//         Text(text.text1, style: TextStyle(fontSize: 20),),
//         Spacer(),
//         Text(text.text2, style: TextStyle(fontSize: 20),),
//       ],),
//     );
//   }
// }