import 'package:flutter/material.dart';

class RoundedCard extends StatelessWidget {

  RoundedCard({this.child, this.onPressed, this.color});

  final Function onPressed ;
  final Color color;
  final Widget child ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: color ,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onPressed ,
          minWidth: 200.0,
          height: 42.0,
          child: child ,
        ),
      ),
    );
  }
}