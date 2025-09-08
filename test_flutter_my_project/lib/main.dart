import 'package:flutter/material.dart';
import 'package:test_flutter_my_project/widgets/WidgetImage.dart';
import 'package:test_flutter_my_project/widgets/screenButtomBar.dart';
import 'package:test_flutter_my_project/widgets/start_cross.dart';
import 'package:test_flutter_my_project/widgets/textfieldtest.dart';
import 'package:test_flutter_my_project/widgets/textftestfunction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        bottomAppBarTheme: BottomAppBarTheme(
        )
      ),
      routes: {
        '/start': (context) => StartCross(),
        '/bar': (context) => ButtomBar(),
        '/example': (context) => Example(),
        '/examplee': (context) => Examplee(),
        '/Imagee': (context) => Imagee()
        

        
      },
      initialRoute: '/Imagee',
    );
  }
}
