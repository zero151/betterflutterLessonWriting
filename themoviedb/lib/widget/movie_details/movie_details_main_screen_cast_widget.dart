import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:themoviedb/resources/resources.dart';

class MovieDetailsMainScreenCastWidget extends StatelessWidget {
  const MovieDetailsMainScreenCastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final styleCast = TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w600);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text('Top Billed Cast',
            style: styleCast),
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 230,
            child: Scrollbar(
              child: ListView.builder(
                itemCount: 20,
                itemExtent: 122,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index){
                return Padding(
                  padding: EdgeInsets.only(left: 10, right: 4),
                  child: DecoratedBox(
                    decoration:  BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black.withOpacity(0.2)),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: Offset(0, 2)
                    )]
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      clipBehavior: Clip.hardEdge,
                      child: Column(
                        children: [
                          Image(image: AssetImage(Images.actor)),
                          Padding(padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Michael B. Jordan',
                              maxLines: 2,
                                style:  TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700)),
                          Text('John Kelly',
                          maxLines: 2,),
                            ],
                          ),)
                        ],
                      ),
                    ),
                  ),
                );
              },),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextButton(onPressed: (){}, 
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.black),
              padding: MaterialStateProperty.all(EdgeInsets.all(0))),
            child: Text('Full Cast & Crew',
              style: styleCast
            )),
          ),
        ],
      ),);
  }
}