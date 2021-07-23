# Summary
In summary we note the following:
<br></br>
At the top, we always import:
```import 'package:flutter/material.dart'; ```

## Important Widget Combinations:

1. MaterialApp with Navigation
```
MaterialApp(
  initialRoute : '/' ,
  routes : {
    '/' : (context)=>HomeScreen() ,
    'contact' : (context)=>ContactScreen(),
  },
 )
 ```
 
2. Scaffold
```
Scaffold(
  backgroundColor:Colors.lightBlueAccent ,
  appBar : AppBar(
            title:
            color:
           ),
  body  : SafeArea(
            child: Center(
              child:
            ),
          ),
)
```

3. Image
Modify ```pubspecs.yaml``` put:
```
  assets:
    -images/
```
Then you can use images as:
```
Image(
  image : AssetImage('image/'),
)
```

4. Column and Row:
  Use a combination of these to style up an UI
```
Column(
  children : <Widget>[] , //a List<Widget>
  mainAxisAlignment : MainAxisAlignment.center,
  crossAxisAlignment : CrossAxisAlignment.stretch, // stretch all children
),
```

5. Container:
```
Container(
  child:
  width: 10.0, //putting width as double.infinity would make it span the screen
  height: 20.0,
  padding: EdgeInsets.all(10.0), //other options also available
  decoration: BoxDecoration(
      borderRadius : BorderRadius.only(topLeft : Radius.circular(20.0)),
      color : Color[0xff123456],
    ),
)
```

6. Fonts:
To get new fonts, download the font file in fonts folder ( make a fonts folder ). Then in ```pubspecs.yaml``` , you can have for example:
```
fonts:
    - family: Pacifico
      fonts:
        - asset: fonts/Pacifico-Regular.ttf
 ```
 
 To style up the text, you can use:
 ```
 Text(
  'Hello World'
   style : TextStyle(
    fontFamily : 'Pacifico',
    fontSize : 30.0,
    color : Colors.blue,
    fontWeight : FontWeight.bold,
   ),
 )
 ```
 
 7. Seperating out:
 You can use the following to make a blank space:
 ```
 SizedBox(
  height: 10.0, 
 ),
 ```
 To draw a horizontal line :
 ```
 SizedBox(
           width: 100.0,
           child: Divider(
            color: Colors.white,
           ),
         ),
  ```
  
8. Icons:
```
Icon(
  icon: Icons.email,
  color:
  size:
)
```

You can also have another type of icons by adding dependency ```font_awesome_flutter: ^8.4.0``` to ```pubspec.yaml```
Then, ```import 'package:font_awesome_flutter/font_awesome_flutter.dart';```. Now you can have
```
Icon(
 FontAwesomeIcons.minus ,
 color: Colors.white,
 size: 20.0,
 ),
 ```

9. Card:
```
Card(
  color:
  margin:
  padding:
  child:
)
```

10. ListTile:
```
ListTile(
  leading: 
  title:
  subtitle:
  trailing:
)
```
11. FlatButton:
```
FlatButton(
  child:
  onPressed: (){
  
  }
)
```

12. Expanded:
A widget which is child of a row/ column and will take up all space that is blank in the parent.
```
Expanded(
  flex: // a number. indicates ratio of size with other expanded widgets inside the same parent
  child: Padding(
    padding: EdgeInsets.symmetric( vertical: 10.0, horizontal: 20.0),
    child: 
  )  
)
```

13. List of similar widgets
To make a list of similar widgets, you can do:
 ```
 List<Widget> myList = []
 for( text in StringList ){
  myList.add(Text(text));
 }
 ```
 
 14. Playing Audio
 To ```pubspec.yaml``` add dependency ```audioplayers: ^0.10.0```. Store the audio file in assets folder. Add
 ```
 assets:
  - assets/
  ```
  In the main program, ```import 'package:audioplayers/audio_cache.dart';```
  Then you can play audio as:
  ```
  final player = AudioCache();
  player.play('note2.wav');
  ```
  
  15. Slider
  ```
  Slider(
          value: 150.0,
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
  ```
  
  16. Rounded Buttons
  ```
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
```

17. FloatingActionButton
18. CircularAvatar
Useful to display circular objects
```
CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('images/appstore.png'),
            ),
```  
  
  
  

## Important Ideas

1. Place all constants in a ```constants.dart``` file. Also begin names of constants with ```k```.
2. Setting State:
  In a Stateful Widget's State class, you can use
  ```
  setState(){
  
  }
  ```
  The variables that are assigned inside change throughout the class
  
3. Theme:
  You can set a theme for the whole app by using
  ```
  MaterialApp(
  theme:  ThemeData(
        primaryColor: Color(0xff0A0E21),
        accentColor: Colors.purple,
        scaffoldBackgroundColor: Color(0xff0A0E21),
        textTheme: TextTheme(
        body1: TextStyle(
        color: Colors.white,
      ),
  )
  ```
  You can also copy from existing themes and make small changes
  ```
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
  ```
  
  Similarly, you can achieve fine-grained control on any widget's appearance by making use of it's Theme class. For example:
  ```
  SliderTheme(
              data: SliderTheme.of(context).copyWith(
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
               ),
              child: Slider()
  )
  ```
  
  4. Making Custom Widgets:
  You can make custom widgets by using components that constitute current widgets. You can also add functionality to them by passing in a function and giving them a member
  ```final Function onTap;```
  
  5. Sharing data between two screens:
  Make a global variable that has the data in the parent screen. Then import the parent screen and use this data in the other screen
  
  6. Accessing data in a Stateful widget
  Consider a member of the Stateful widget say ```int x=1```. To access it in the corresponding State class, you can use ```widget.x```
            

## Math
Use ```import 'dart:math';```. To generate random integers in 0 to 5 use ```Random().nextInt(6)```








   
