import 'package:flutter/material.dart';

class StartCross extends StatelessWidget {
  const StartCross({super.key});

  @override
  Widget build(BuildContext context) {
    void onPres(){
      Navigator.of(context).pushNamed('/bar');
    }
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                style: TextStyle(color: Colors.black,
                fontSize: 16),
                decoration: InputDecoration(
                  enabled: true, // активна не активна

                  labelText: 'Phone',
                  labelStyle: TextStyle(color:Colors.black),
                  floatingLabelBehavior: FloatingLabelBehavior.never, //наверк не улетает phone

                  prefixIcon: Icon(Icons.phone), 
                  prefixIconColor: Colors.black,
                  prefix: Text('+7'), //за тебя вводит +7
                  prefixStyle: TextStyle(color: Colors.black, fontSize: 16),
                  hintText: 'qw', //подсказка при вводе

                  
                  filled:true,
                  fillColor: Colors.deepPurple,


                  // isCollapsed: true,
                  // contentPadding: EdgeInsets.all(20),//делаем свои отступы


                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2
                    ),
                  ),
                  // focusedBorder: UnderlineInputBorder(
                  //   borderSide: BorderSide(
                  //     color: const Color.fromARGB(255, 0, 255, 183),
                  //     width: 2,
                  //   )
                  // )
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                )
              ),
              SizedBox(height: 25),
              ElevatedButton(
                onPressed: onPres, child: Text('Переход')),
            ],
          ),
        ),
      ),
    );
  }
}