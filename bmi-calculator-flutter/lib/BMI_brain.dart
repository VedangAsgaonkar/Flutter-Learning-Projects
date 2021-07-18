import 'dart:math';

class BMIBrain{
  BMIBrain({this.height, this.weight});
  int height;
  int weight;

  double getBMI(){
    double bmi = 10*weight/pow(height/100 , 2);
    return bmi.toInt()/10.0 ;
  }
}