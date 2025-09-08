import 'package:flutter/material.dart';
import 'package:test_flutter_my_project/resources/resources.dart';

class Imagee extends StatelessWidget {
  const Imagee({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Image(image: AssetImage(AppImages.cross)),
        ),
      ),
    );
  }
}