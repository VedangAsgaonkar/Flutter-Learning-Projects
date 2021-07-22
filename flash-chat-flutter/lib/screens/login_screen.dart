import 'package:flash_chat/rounded_card.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false ;
  final _auth = FirebaseAuth.instance ;
  String email;
  String password ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false , // Important
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                style: TextStyle(
                  color: Colors.black ,
                ),
                onChanged: (value) {
                  email = value ;
                  //Do something with the user input.
                },
                decoration: kInputDecorationEmail ,
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                style: TextStyle(
                    color: Colors.black ,
                ),
                onChanged: (value) {
                  password = value ;
                  //Do something with the user input.
                },
                decoration: kInputDecorationEmail.copyWith(hintText : "Enter Password" ) , //using the idea of themes
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedCard(
                child: Text(
                  'Log In',
                ),
                onPressed: () async{
                  setState(() {
                    showSpinner = true ;
                  });
                  try{
                    final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                    if(user != null){
                      Navigator.pushNamed(context, 'chat');
                    }
                  }
                  catch(e){
                    print(e) ;
                  }
                  setState(() {
                    showSpinner = false ;
                  });
                  //Implement login functionality.
                },
                color: Colors.lightBlueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


