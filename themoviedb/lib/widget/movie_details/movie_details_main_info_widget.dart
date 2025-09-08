import 'package:flutter/material.dart';
import 'package:themoviedb/resources/resources.dart';
import 'package:themoviedb/widget/elements/drawProgressBar.dart';

class MovieDetailsMainInfoWidget extends StatelessWidget {
  const MovieDetailsMainInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TopPosterWidget(),
        Padding(
          padding: const EdgeInsets.all(20),
          child: _MovieNameWidget(),
        ),
        _ScoreWidget(),
        _SummeryWidget(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Derection(),
              SizedBox(height: 30),
              People()
            ],
          ),
        ),
        
      ],
    );
  }
}

class _TopPosterWidget extends StatelessWidget {
  const _TopPosterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(image: AssetImage(Images.backgroudPoster)),
        Positioned(
          top: 20,
          left: 20,
          bottom: 20,
          child: Image(image: AssetImage(Images.postrer))
          ),
      ],
    );
  }
}

class _MovieNameWidget extends StatelessWidget {
  const _MovieNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      maxLines: 3,
      text: TextSpan(children: [
        TextSpan(text: 'Tom Clancy`s Without Remorse ',
        style: TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.w600)
        ),
        TextSpan(text: '(2021)',
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w400))
      ])
      );
  }
}

class _ScoreWidget extends StatelessWidget {
  const _ScoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(onPressed: (){}, 
        child: Row(
          children: [
            SizedBox(
              width: 45,
              height: 45,
              child: RadiusPercentWidget(
              percent: 0.70,
              fillColor: Color.fromARGB(255, 10, 23, 25),
              lineColor: Color.fromARGB(255, 37, 203, 103),
              freeColor: Color.fromARGB(255, 25, 54, 31),
              lineWidth: 3,
              child: Text('70', style: TextStyle(fontSize: 16, color: Colors.white),),
              ),
            ),
            SizedBox(width: 10,),
            Text('User Score',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700)),
          ],
        )),
        Container(width: 1, height: 15, color: Colors.grey,),
        TextButton(onPressed: (){}, child: Row(
          children: [
            Icon(Icons.play_arrow,
            color: Colors.white,),
            Text(' Play Trailer',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,)),
          ],
        )),

      ],
    );
  }
}

class _SummeryWidget extends StatelessWidget {
  const _SummeryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Color.fromRGBO(22,21,25,1.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 65),
        child: Text('R, 04/29/2021 (US) 1h 49m Action, Thriller, War',
        textAlign: TextAlign.center,
        maxLines: 3,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w400)),
      ),
    );
  }
}


class Derection extends StatelessWidget {
  const Derection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text('Overview',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600)),
            ),
            Text('An elite Navy SEAL uncovers an international conspiracy while seeking justice for the murder of his pregnant wife.',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400)),
          ],
        );
  }
}

class People extends StatelessWidget {
  const People({super.key});

  @override
  Widget build(BuildContext context) {
    final nameStyle = TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700);
    final jobTitleStyle = TextStyle(
                color: Colors.white,
                fontSize: 14.5,
                fontWeight: FontWeight.w400);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Stefano Sollima', style: nameStyle),
                      Text('Director',style: jobTitleStyle)
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Tom Clancy', style: nameStyle),
                      Text('Novel',style: jobTitleStyle)
                    ],
                  ),
                ),
              ],),
              SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Taylor Sheridan', style: nameStyle),
                      Text('Screenplay',style: jobTitleStyle)
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Will Staples', style: nameStyle),
                      Text('Screenplay',style: jobTitleStyle)
                    ],
                  ),
                ),
              ],),
      ],
    );
  }
}