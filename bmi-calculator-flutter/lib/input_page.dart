import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'BMI_brain.dart';

const double bottomContainerHeight = 80.0;
const Color activeCardColor = Color(0xff1d1e33);
const Color inactiveCardColor = Color(0xff111328);
BMIBrain b = BMIBrain(height : 120, weight : 60);


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color mcc = inactiveCardColor;
  Color fcc = inactiveCardColor;
  int height = 120 ;
  int weight = 60 ;
  int age = 25 ;

  void updateColor(int gb) {
    if (gb == 1) {
      if (mcc == inactiveCardColor) {
        mcc = activeCardColor;
        fcc = inactiveCardColor;
      }
    } else {
      if (fcc == inactiveCardColor) {
        fcc = activeCardColor;
        mcc = inactiveCardColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(1);
                      });
                    },
                    child: ReusableCard(
                      c: mcc,
                      cardChild: GenderCard(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(2);
                      });
                    },
                    child: ReusableCard(
                      c: fcc,
                      cardChild: GenderCard(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              c: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Color(0xff8d8e98),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: TextStyle(
                          fontSize: 50.0 ,
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        'cm',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Color(0xff8d8e98),
                        ),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      activeColor: Color(0xffeb1555),
                      inactiveColor: Color(0xff8d8e98),
                      onChanged: (double newValue){
                        setState(() {
                          height = newValue.toInt() ;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                      c: activeCardColor,
                      cardChild: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Color(0xff8d8e98),
                            ),
                          ),
                          Text(
                            weight.toString(),
                            style: TextStyle(
                              fontSize: 50.0 ,
                              color: Color(0xffffffff),
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                child : Icon(
                                  FontAwesomeIcons.minus ,
                                  color: Colors.white,
                                ),
                                onPressed: (){
                                  setState(() {
                                    weight = weight-1 ;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                child : Icon(
                                  FontAwesomeIcons.plus,
                                  color: Colors.white,
                                ),
                                onPressed: (){
                                  setState(() {
                                    weight = weight+1 ;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    c: activeCardColor,
                    cardChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xff8d8e98),
                          ),
                        ),
                        Text(
                          age.toString(),
                          style: TextStyle(
                            fontSize: 50.0 ,
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              child : Icon(
                                FontAwesomeIcons.minus ,
                                color: Colors.white,
                              ),
                              onPressed: (){
                                setState(() {
                                  age = age-1 ;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              child : Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                              onPressed: (){
                                setState(() {
                                  age = age+1 ;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          RedButton(
            label: 'CALCULATE',
            onClick: (){
              b.height = height ;
              b.weight = weight ;
              Navigator.pushNamed(context, '/output') ;
            },
          ),
        ],
      ),

      // floatingActionButton:Theme(
      //   data: ThemeData(
      //     accentColor: Colors.amberAccent,
      //   ),
      //   child: FloatingActionButton(
      //     child: Icon(Icons.add),
      //   ),
      // ),
    );
  }
}

class RedButton extends StatelessWidget {
  RedButton({this.label, this.onClick});

  final String label;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick ,
      child: Container(
        color: Color(0xffeb1555),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: bottomContainerHeight,
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 18.0,
              color: Color(0xffffffff),
              fontWeight:  FontWeight.bold ,
            ),
          ),
        ),
      ),
    );
  }
}

class GenderCard extends StatelessWidget {
  GenderCard({this.icon, this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xff8d8e98),
          ),
        )
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.c, this.cardChild});

  final Color c;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: c,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}


class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.child, this.onPressed});

  final Widget child ;
  final Function onPressed ;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: this.child ,
      onPressed: this.onPressed ,
      shape:  CircleBorder(),
      fillColor: Color(0xff0A0E21),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      elevation: 6,
    );
  }
}
