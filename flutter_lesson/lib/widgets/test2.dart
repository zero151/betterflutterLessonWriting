import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
   const MyWidget({super.key});
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: ListView.builder(
        addAutomaticKeepAlives: true,
        itemBuilder: (BuildContext context, int index){
        return Ex(text: '$index');
      })
    ); 
  }
}

class Ex extends StatefulWidget {
  final String text;
  const Ex({super.key, required this.text});

  @override
  State<Ex> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Ex> with AutomaticKeepAliveClientMixin{
  late final TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.text);
  }
  @override
  Widget build(BuildContext context) {
    return TextField(controller: controller,);
  }
  
  @override
  bool get wantKeepAlive => true;
}
// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           color: Colors.red,
//           child: CustomMultiChildLayout(
//             delegate: OwnMultiChildLayoutDelegate(),
//             children: [
//               LayoutId(
//                 id: 1, 
//                 child: Text('dvvvvvvvvvvvvdddddbbbbbbbb1')
//               ),
//               LayoutId(
//                 id: 2, 
//                 child: Text('2')
//               ),
//               LayoutId(
//                 id: 3, 
//                 child: Text('3dsvdvsvsvsvsvsvsvsvsvsvsvsvsvsvsvsvsvsdvdsvvvvvvvvvvvvvv')
//               )
      
//             ],
//             ),
//         ),
//       ),
//     );
    
//   }
// }

// class OwnMultiChildLayoutDelegate  extends MultiChildLayoutDelegate {
//   @override
//   Size getSize(BoxConstraints constraints) => Size(constraints.biggest.width, 100);
//   @override
//   void performLayout(Size size) {
//     if(hasChild(1) && hasChild(2) && hasChild(3)){
//       final minOtherElement = 50;

//       final firstMaxElement = size.width - minOtherElement * 2;
//       final firstElementSize = layoutChild(1, BoxConstraints.loose(Size(firstMaxElement, size.height)));

//       final thirdMaxElement = size.width - firstElementSize.width -minOtherElement;
//       final thirdElementSize = layoutChild(3, BoxConstraints.loose(Size(thirdMaxElement, size.height)));

//       final secondMaxElement = size.width - firstElementSize.width - thirdMaxElement;
//       final secondElementSize = layoutChild(2, BoxConstraints.loose(Size(secondMaxElement, size.height)));
      
//       final firstElementHeight = size.height / 2 - firstElementSize.height / 2;
//       positionChild(1, Offset(0, firstElementHeight));

//       final thirdElementWidth = size.width - thirdElementSize.width;
//       final thirdElementHeight = size.height / 2 - thirdElementSize.height / 2;
//       positionChild(3, Offset(thirdElementWidth, thirdElementHeight));

//       var secondElementWidth = size.width / 2 - secondElementSize.width / 2 ;
//       if(firstElementSize.width > secondElementSize.width){
//         secondElementWidth = firstElementSize.width;
//       }else if(thirdElementWidth < secondElementWidth + secondElementSize.width){
//         secondElementWidth = thirdElementWidth - secondElementSize.width;
//       }
//       final secondElementHeight = size.height / 2 - secondElementSize.height / 2;
//       positionChild(2, Offset(secondElementWidth, secondElementHeight));
//     }
//     }

//   @override
//   bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
//     return true;
//   }
  
// }
