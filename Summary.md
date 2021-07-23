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
      image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
          ),
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
  
19. Navigator
* Named routes
```
MaterialApp(
  initialRoute : '/' ,
  routes : {
    '/' : (context)=>HomeScreen() ,
    'contact' : (context)=>ContactScreen(),
  },
 )
 ```
 Now you can push screens as ```Navigator.pushNamed(context, 'contact')```. You can pop screen as ```Navigator.pop(context)```.
 
 * Direct push
 You can directly push a screen using 
 ```Navigator.push(context, MaterialPageRoute(builder: (context){ return ContactScreen(); } ));```
 Pop remains same
 
 20. Getting location
 Add dependency ```geolocator: ^3.0.1``` to ```pubspec.yaml``` . To ```AndroidManifest.xml``` add the permission for location as
 ```<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />``` just after the ```<manifest>``` opening tag.
 
 Now, to get location, ```import 'package:geolocator/geolocator.dart' ;	```
 Then we can use
 ```
 class Location{

  var latitude ;
  var longitude ;

  Future<void> getLocation() async{
    try {
      Position position = await Geolocator().getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    }
    catch(e){
      print(e);
    }

  }
}
 ```
 and
 ```
 Future<void> printLocation() async{
    Location l = Location();

    try {
      await l.getLocation();
      latitude = l.latitude;
      longitude = l.longitude;
    }
    catch(e){
      print("Error");
    }
  }
 ```
 
 21. DropdownMenu
 Make the list that goes into the menu:
 ```
 List<DropdownMenuItem<String>> currencies = [DropdownMenuItem<String>(
    child: Text('Select Currency'),
    value: 'Select Currency',
  )] ;
 ```
 Add elements to this list. Then feed it into the dropdown menu:
 ```
 DropdownButton<String>(
              value: selectedCurrency, //the value that will show in the closed form
              items: currencies,
	      onChanged : (value){
	      
	      },
	      )
 ```

 22. spinner, model progess hud, animations 

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
  
  7. Making API calls
  In ```pubspec.yaml``` add dependency ```http: ^0.12.0+2```. Then ```import 'package:http/http.dart'; import 'dart:convert';```.
  Then
  ```
  void getData() async{
    Response response = await get(//put url String here with api key);
    String data= response.body ;
    var decodedData = jsonDecode(data) ;
    var weatherDesc = decodedData['weather'][0]['description'] ;
    print(data);
  }
  ```
  
  8. Sharing data between screens while pushing
  To send data to a screen that you are pushing, you can create a member in that screen, and make a constructor allowing us to push data
  ```Navigator.push(context, MaterialPageRoute(builder: (context){ return ContactScreen(name: "Hello",); } ));```
  
  9. Sharing data between screens while poping
  The pop method can return data through the second optional parameter
  ```Navigator.pop(context, cityName);```
  The corresponding push must await this data and return it to the variable being assigned
  ```
  onPressed: () async{
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CityScreen();
                          },
                        ),
                      );
                    },
 ```           

10. The initState() method
Any task to be performed while the screen is made is written inside initState() of the State class
```
@override
  void initState() {
    super.initState();
    // The action to be done
  }
```


## Math
Use ```import 'dart:math';```. To generate random integers in 0 to 5 use ```Random().nextInt(6)```

## Async
The control in any program flows sequentially throught the code. Now it may happen that some function being called is very time consuming. In this case,
we may wish that the program continue ahead while the function is being executed. Thus such a function is declared async.


void printPosition() async{
	//get and print position
}

void main(){
	print("Hi");
	printPosition();
	print("Hello");
}

Now, it may happens that we wish to use the data returned by an async function. In that case, we need to await its execution. But parts of code
that donot depend on that data should not have to wait. So the following construction is typical


Future<Position> printPosition() async{
	//get and return position
}

void processPosition() async{
	Postion p = await printPosition()
	//does something with position
}

void main(){
	print("Hi");
	processPosition();
	print("Hello");
}

U can only await on a method that returns a future.

If we had not awaited for the Position, it would have had a null value and in the processing code. In that case we would have to declare it as a Future<Position>
This means it is kind of a promise that Position would be recieved in the future.

## Classes and Objects
Dart, like Java, is a language where the object name is just a pointer to a data location in the heap. This means that we can pass the object name into a method, make changes to it and the original object would get changed. There is no copy-constructor for objects.

## Firebase
Create a firebase account. Setup authorisation and firebase database.
Then, in ```pubspec.yaml``` add the following dependencies:
```
firebase_core: ^0.3.4
firebase_auth: ^0.8.4+4
cloud_firestore: ^0.9.13+1
```
In ```AndroidManifest.xml``` add the following permissions after the ```<manifest>``` start tag:
```
<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
<uses-permission android:name="android.permission.ACCESS_WIFI_STATE"/>
```

1. Register
```import 'package:firebase_auth/firebase_auth.dart';```. Then create the following:
```
final _auth = FirebaseAuth.instance ;
String email ;
String password ;
```
Then,
```
void register() async{
	try{
           final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
             if(newUser != null){
               Navigator.pushNamed(context, 'chat');
             }
         }
        catch(e){
          print(e) ;
        }
}
```

2. Login
```import 'package:firebase_auth/firebase_auth.dart';```. Then create the following:
```
final _auth = FirebaseAuth.instance ;
String email ;
String password ;
```
Then, to Login:
```
	void login() async{
                  try{
                    final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                    if(user != null){
                      // action for successful login
                    }
                  }
                  catch(e){
                    print(e) ;
                  }
	}
```

   
