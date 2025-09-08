import 'package:flutter/material.dart';
import 'package:themoviedb/Theme/app_colors.dart';
import 'package:themoviedb/widget/auth/auth_widget.dart';
import 'package:themoviedb/widget/main_screen/main_screen_widget.dart';
import 'package:themoviedb/widget/movie_details/movie_details_widget.dart';

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
        appBarTheme: AppBarTheme(
          backgroundColor: AppColorsStyle.mainDarkBlue, 
          foregroundColor: Colors.white,
          centerTitle: true),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: AppColorsStyle.mainDarkBlue,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey.shade600,
          )
      ),
      routes: {
        '/auth': (context) => AuthWidget(),
        '/mainScreen': (context) => MainScreenWidget(),
        '/mainScreen/movie_details': (context)  {
          final arguments = ModalRoute.of(context)?.settings.arguments as int;
          if(arguments is int){
            return MovieDetailsWidget(movieId: arguments);
          }
          return MovieDetailsWidget(movieId: 0);
          }
      },
      initialRoute: '/auth',
    );
  }
}

