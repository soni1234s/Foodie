import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'loginPage.dart';
import 'package:order_food/Pages/verify.dart';
import 'package:flutter/cupertino.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email, password, cpassword;
  final auth = FirebaseAuth.instance;

  User user;

  //bool _autovalidate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                  child: Image.asset('asset/images/1.jpg'),
                  margin: EdgeInsets.only(top: 20),
                  height: 200,
                  width: 100,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    // controller: nameController,
                    autovalidateMode: AutovalidateMode.always,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),

                    // ignore: missing_return
                    onChanged: (value) {
                      setState(() {
                        email = value.trim();
                      });
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: TextFormField(
                    obscureText: true,
                    // controller: passwordController,
                    autovalidateMode: AutovalidateMode.always,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                    onChanged: (value) {
                      setState(() {
                        password = value.trim();
                      });
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: TextFormField(
                    obscureText: true,
                    autovalidateMode: AutovalidateMode.always,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Confirm-Password',
                    ),
                    validator: (value) {
                      if (value != null && value != password) {
                        return "Password Does no match";
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.black,
                      child: Text('Sign Up'),
                      onPressed: () {
                        auth
                            .createUserWithEmailAndPassword(
                                email: email, password: password)
                            .then((_) {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => VerifyScreen()));
                        });
                      },
                    )),
                Container(
                    child: Row(
                  children: <Widget>[
                    Text('Already Have An Account?'),
                    FlatButton(
                      textColor: Colors.blue,
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 20, color: Colors.orange),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => LoginPage()));
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ))
              ],
            )));
  }
}
