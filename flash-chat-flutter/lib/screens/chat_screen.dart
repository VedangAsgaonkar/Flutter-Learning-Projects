import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final textEditingController = TextEditingController();
  final _firestore = Firestore.instance ;
  final _auth = FirebaseAuth.instance ;
  FirebaseUser loggedInUser ;
  String messageText ;


  // this method is used for pulling data from firebase
  void getMessagesPull() async{
    final messages = await _firestore.collection('messages').getDocuments(); // gets a Future<DocumentSnapshot>
    for( var message in messages.documents){
      print(message.data);
    }
  }

  // this method helps firestore push to our app
  void messagesStream() async{
    await for( var snapshot in _firestore.collection('messages').snapshots()){
      for ( var message in snapshot.documents){
        print(message.data);
      }
    } //gets a Stream<DocumentSnapshot>
  }

  void getCurrentUser() async{
    try{
      final user = await _auth.currentUser() ;
    if(user != null){
      loggedInUser = user ;
      print(loggedInUser.email);
    }
    }
    catch(e){
      print(e) ;
    }

  }

  @override
  void initState() {

    super.initState();
    getCurrentUser() ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                //messagesStream(); // as soon as button is clickes, the method is called leading to a subscription to the stream. Now anytime there is a change in the stream, it results in a flow-in of data
               _auth.signOut();
               Navigator.pop(context) ;
                //Implement logout functionality
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('messages').snapshots(),
              builder: (context, snapshot){
                if(snapshot.hasData){
                  final messages = snapshot.data.documents.reversed;
                  List<MessageBubble> messageWidgets = [];
                  for( var message in messages){
                    final messageText = message.data['text'];
                    final messageSender = message.data['sender'];

                    final currentUser = loggedInUser.email ;

                    final messageWidget = MessageBubble(messageText: messageText, messageSender: messageSender, isMe : currentUser==messageSender);
                    messageWidgets.add(messageWidget);
                  }

                  return Expanded(
                    child: ListView(
                      reverse: true,
                      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                      children: messageWidgets,
                    ),
                  );
                }
                else{
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.lightBlueAccent,
                    ),
                  ) ;
                }
              },
            ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: textEditingController,
                      onChanged: (value) {
                        messageText = value ;
                        //Do something with the user input.
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: (){
                      try{
                          _firestore.collection('messages').add({
                            'text' : messageText ,
                            'sender' : loggedInUser.email ,
                          });
                      }
                      catch(e){

                      }
                      setState(() {
                        textEditingController.clear();
                      });
                      //Implement send functionality.
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({this.messageText, this.messageSender, this.isMe});

  final messageText ;
  final messageSender ;
  final isMe ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isMe? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(messageSender, style: TextStyle(fontSize: 12.0, color: Colors.black54),),
          Material(
            elevation: 5.0,
            borderRadius: isMe ? BorderRadius.only(topLeft: Radius.circular(30.0), bottomLeft: Radius.circular(30.0), bottomRight: Radius.circular(30.0),) : BorderRadius.only(topRight: Radius.circular(30.0), bottomLeft: Radius.circular(30.0), bottomRight: Radius.circular(30.0),),
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                messageText ,
                style: TextStyle(
                  fontSize: 16.0,
                  color: isMe ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

