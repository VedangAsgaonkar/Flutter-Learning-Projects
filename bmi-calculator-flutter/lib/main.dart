import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';
import 'output_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme:  ThemeData(
      //   primaryColor: Color(0xff0A0E21),
      //   accentColor: Colors.purple,
      //   scaffoldBackgroundColor: Color(0xff0A0E21),
      //   textTheme: TextTheme(
      //   body1: TextStyle(
      //   color: Colors.white,
      // ),
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff0A0E21),
        accentColor: Colors.purple,
        scaffoldBackgroundColor: Color(0xff0A0E21),

        textTheme: TextTheme(
          body1: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => InputPage() ,
        '/output' : (context) => OutputPage() ,
      },
    );
  }
}
