# Summary
In summary we note the following:

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
            child:
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
