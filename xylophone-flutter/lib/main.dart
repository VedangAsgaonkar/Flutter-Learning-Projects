import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
//import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

Widget buildTab({Color color, int soundNumber }){
  return Expanded(
    child: Card(
      color: color,
      child: FlatButton(
        onPressed: (){
          final player = AudioCache();
          player.play('note$soundNumber.wav');
        },
      ),
    ),
  );
}

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(
            child: Text(
              'Xylophone',
              style : TextStyle(
                color: Colors.white,
                fontSize: 30.0,
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              buildTab(color: Colors.red, soundNumber: 1),
              Expanded(
                child: Card(
                  color: Colors.orange,
                  child: FlatButton(
                    onPressed: (){
                      final player = AudioCache();
                      player.play('note2.wav');
                    },
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  color: Colors.yellow,
                  child: FlatButton(
                    onPressed: (){
                      final player = AudioCache();
                      player.play('note3.wav');
                    },
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  color: Colors.green,
                  child: FlatButton(
                    onPressed: (){
                      final player = AudioCache();
                      player.play('note4.wav');
                    },
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  color: Colors.teal[500],
                  child: FlatButton(
                    onPressed: (){
                      final player = AudioCache();
                      player.play('note5.wav');
                    },
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  color: Colors.blue,
                  child: FlatButton(
                    onPressed: (){
                      final player = AudioCache();
                      player.play('note6.wav');
                    },
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  color: Colors.purple,
                  child: FlatButton(
                    onPressed: (){
                      final player = AudioCache();
                      player.play('note7.wav');
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


