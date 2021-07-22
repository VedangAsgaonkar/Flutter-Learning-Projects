import 'package:flutter/material.dart';
import 'package:flash_chat/rounded_card.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance ;
  String email ;
  String password ;
  bool showSpinner = false;


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
              Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                onChanged: (value) {
                  email = value ;
                  //Do something with the user input.
                },
                style: TextStyle(
                  color: Colors.black ,
                ),
                decoration: kInputDecorationEmail ,
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                onChanged: (value) {
                  password = value ;
                  //Do something with the user input.
                },
                style: TextStyle(
                  color: Colors.black ,
                ),
                decoration: kInputDecorationEmail.copyWith(hintText : "Enter Password" ) ,
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedCard(
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  setState(() {
                    showSpinner = true ;
                  });
                  print(email);
                  print(password);
                  try{
                    final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                    if(newUser != null){
                      Navigator.pushNamed(context, 'chat');
                    }
                  }
                  catch(e){
                    print(e) ;
                  }
                  setState(() {
                    showSpinner = false ;
                  });

                //Implement registration functionality.
                },
                color: Colors.blueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

