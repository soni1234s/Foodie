import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

//import 'home_page.dart';
import 'package:flutter/cupertino.dart';

class ResetScreen extends StatefulWidget {
  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  
  String email;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title:Text('Forgot Password'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                
                Container(
                  margin: EdgeInsets.only(top: 50),
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                    onChanged: (value) {
                setState(() {
                  email = value.trim();
                });
              },
                  ),
                ),
                
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blueAccent,
                      child: Text('Send request'),
                      onPressed: (){
                        auth.sendPasswordResetEmail(email: email);
                        Navigator.of(context).pop();
                  },
                    )),
                
              ],
            )));
  }
}
