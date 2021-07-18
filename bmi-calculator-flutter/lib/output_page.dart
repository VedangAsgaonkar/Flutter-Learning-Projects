import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';

Text getText(double bmi){
  if(bmi>18 && bmi<26){
    return Text(
      'normal bmi',
      style: TextStyle (
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: Colors.green,
      ),
    );
  }
  else if(bmi<=18){
    return Text(
      'low bmi',
      style: TextStyle (
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: Colors.red,
      ),
    );
  }
  else{
    return Text(
      'high bmi',
      style: TextStyle (
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: Colors.red,
      ),
    );
  }
}

class OutputPage extends StatefulWidget {

  @override
  _OutputPageState createState() => _OutputPageState();
}

class _OutputPageState extends State<OutputPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: Center(
              child: Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          ReusableCard(
            c: activeCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                getText(b.getBMI()),
                Center(
                  child: Text(
                    b.getBMI().toString(),
                    style: TextStyle(
                      fontSize: 100.0 ,
                      color: Color(0xffffffff),
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                )
              ],
            ),
          ),
          RedButton(
            label: 'RECALCULATE BMI',
            onClick: (){
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
