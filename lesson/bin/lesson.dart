// Задание: Асинхронный генератор чисел с задержкой
// Цель:
// Написать программу на Dart, которая:

// Генерирует числа от 1 до N асинхронно (async*).

// Добавляет задержку между числами (Future.delayed).

// Использует await for для обработки чисел.

// Выводит результат в консоль.
import 'dart:async';

final StreamController<int> controller = StreamController<int>();

void main() async {
  print('start');

  // Добавляем числа с задержкой
  for (var i = 0; i < 5; i++) {
    controller.add(i);
  }

  // Подписываемся и выводим данные
  controller.stream.listen((event) => print(event));

  // Закрываем Stream (вызовет onDone в listen)
  await controller.close();

  print('end');
}

// import 'dart:async';

// StreamController<int> controller = StreamController<int>();
// StreamSubscription<int>? subscription;

// void main() {
//   print('One');
//   controller.add(1);
//   controller.add(2);
//   controller.add(3);
//   controller.add(4);
//   controller.add(5);
//   print('Two');

//   subscription = controller.stream.listen((event) async{
//     if(event % 2 == 0){
//       await Future.delayed(Duration(seconds: 2));
//     } 
//     print(event);

//      });
  
// }








// import 'dart:async';
// Future<int> sum(int a, int b) {
//     return Future.sync(() => a + b);
// }

// Future<int> example() async {
//     final a = await sum(1, 4);
//     print(a);
//     final b = await sum(a, 9);
//     print(b);
//     final c = await sum(b, a);
//     return c;
// }

// void main() {
//     print("start");
//     example();
//     print("end");
// }





// void main(List<String> arguments) {
//   print(1);
//   print(2);
//   print(3);
//   var waitingFuture1 = Future.delayed(Duration(seconds: 3));
//   waitingFuture1.then((_) =>print(4) );
//   var waitingFuture2 = Future.delayed(Duration(seconds: 5));
//   waitingFuture2.then((_) =>print(4.1) );
//   final a = Future.wait([waitingFuture1,waitingFuture2]);
//   a.whenComplete(() => print(12));
//   print(4);
//   print(5);
//   print(6);
//   print(7);


// }




// class IncorectIntToString{
//     final String a;

//     IncorectIntToString(this.a);
//     @override
//   String toString() {
//     return 'Переменная  $a не является числом!';
//   }

// }
// class DivisionByZero{
//     @override
//   String toString() {
//     return 'Делить на ноль нельзя!';
//   }

// }
// double div(String a, String b){
//     final double? aa = double.tryParse(a);
//     final double? bb = double.tryParse(b);
//     if(aa == null) throw IncorectIntToString(a);
//     if(bb == null) throw IncorectIntToString(b);
//     if(bb == 0) throw DivisionByZero();
//     return aa / bb;
// }
// void main(List<String> arguments) {
//   try{
//     final q = div('1','dwdw0');
//     print(q);
//   }catch(error){
//     print(error);
//   }finally{
//     print('End');
//   }
// }







// Postav5 sum<Postav5 extends num>(Postav5 a, Postav5 b) => (a + b) as Postav5;

// class Stack<Vetshot>{
//   var storage = <Vetshot>[];
//   void push(Vetshot a) => storage.add(a);
//   Vetshot pop() =>  storage.removeLast();
// }
// void main(List<String> arguments) {
//   var test = sum(1, 2.3);
//   print(test);


//   var stack = Stack();
//   stack.push(11);
//   stack.push('ed');
//   print(stack.storage);
// }



// mixin Open{
//   void open(){
//     print('open');
//   }
// }
// mixin Close{
//   void close(){
//     print('close');
//   }
// }
// mixin Brand{
//   String? brand;
//   void brandd(){
//     print('$brand');
//   }
// }
// mixin TurnOn{
//   void turnOn(){
//     print('turn on laptop');
//   }
// }

// class Door with Open, Close{
// }

// class Laptop with Open, Close, TurnOn, Brand{
//   Laptop(String brand){
//     this.brand = brand;
//   }

// }

// void main(List<String> arguments) {
//   var lap = Laptop("loli");
//   lap.brandd();
//   lap.open();
// }





// enum Room{
//   kids,
//   parents,
//   kitchen
// }

// abstract class WhatRoom{
//   Room room;
//   WhatRoom(this.room);
//   void moveTo(Room a);
// }

// abstract class Weight{
//   final double weight;
//   Weight(this.weight);
// }

// class Cup implements WhatRoom, Weight{
//   @override
//   Room room;
//   @override
//   final double weight;

//   Cup(this.room,this.weight);

//   @override
//   void moveTo(Room a){
//     room = a;
//   }
// }

// void main(List<String> arguments) {
//   final cup = Cup(Room.kids, 1);
//   cup.moveTo(Room.kitchen);
//   print(cup.room);
//   }




// enum Color{
//   white,
//   black,
//   green
// }

// abstract class Furniture{ //мебель  abstract- object can't be created 
//   final double weight; //вес
//   final Color color; //at the beginning of the variable name write _ is private

//   double get test; 

//   Furniture(this.weight, this.color);

//   @override
//   String toString() {
//     return '$weight $color';
//   }
// }

// class Sofa extends Furniture{
//   final double height;      
//   final double width;
//   final double length;
//   double get test => weight - weight / 2;

//   Sofa(super.weight, super.color, this.height, this.width, this.length);

//   @override
//   String toString() {
//     return super.toString() + ' $height $width $length $test';
//   }
// }

// class Table extends Furniture{
//   final double height;
//   final double width;
//   final double length;
//   final int numberOfLegs;
//   double get test => 0;

//   Table(super.weight, super.color, this.height, this.width, this.length, this.numberOfLegs);

//   @override
//   String toString() {
//     return super.toString() + ' $height $width $length $numberOfLegs $test';
//   }
// }

// void main(List<String> arguments) {
//   final sofa = Sofa(110, Color.white, 1100, 800, 1200);
//   final table = Table(110, Color.white, 1100, 800, 1200, 4);
//   if(sofa.color == table.color) print('один цвет');
//   print(sofa);
//   print(table);
//   print(sofa.height);
// }
