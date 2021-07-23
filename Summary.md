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





   
