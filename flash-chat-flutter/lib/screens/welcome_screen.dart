import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/rounded_card.dart';
class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {

  AnimationController controller ;

  Animation animation ;

  Animation colorAnimation ;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      upperBound: 1.0, //if Animation is used, then upperbound has to be 1, otherwise we can change it
      duration: Duration(seconds: 5),
      vsync: this,
    );

    animation = CurvedAnimation(
        parent: controller,
        curve: Curves.decelerate,
    );

    colorAnimation = ColorTween( begin : Colors.green ,end : Colors.yellow).animate(controller);

    // there are other Tween animations like BorderRadiusTween etc.


    controller.forward();
    //to go backwards, u can do controller.reverse(from: 1.0); instead. There, don't specify an upperbound XD


    controller.addListener(() {
      setState(() {});
    });

    //making a loop

    animation.addStatusListener((status) {
      if(status == AnimationStatus.completed){ //at the end of forward animation
        controller.reverse(from : 1.0);
      }
      else if(status == AnimationStatus.dismissed){ // at the end of reverse animation
        controller.forward();
      }
    });

  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorAnimation.value, //linear animation. Doesn't use animator.value
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0, //animation with deceleration curve.
                  ),
                ),
                Text(
                  'Flash Chat ${(animation.value* 99).toInt() }',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedCard(
              child: TypewriterAnimatedTextKit(
                text : ['Login'], // a list of strings printed one by one
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold ,
                ),
              ),
              onPressed:  () {
                Navigator.pushNamed(context, 'login');
                //Go to login screen.
              },
              color: Colors.lightBlueAccent,
            ),
            RoundedCard(
              child: Text(
                'Register',
              ),
              onPressed: () {
                //Go to registration screen.
                Navigator.pushNamed(context, 'reg');
              },
              color: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}


