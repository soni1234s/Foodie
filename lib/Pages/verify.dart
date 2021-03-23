import 'loginPage.dart';
import 'dart:async';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

final auth = FirebaseAuth.instance;
User user;

class VerifyScreen extends StatefulWidget {
  Future<void> checkMobileNumberVerified(
      String verificationMobileNumber) async {
    user = auth.currentUser;
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+44 7123 123 456',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int resendToken) {},
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  Timer timer;

  @override
  void initState() {
    user = auth.currentUser;
    user.sendEmailVerification();

    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      checkEmailVerified();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Container(
          decoration: BoxDecoration(color: Colors.amber, boxShadow: [
            BoxShadow(blurRadius: 10.0, color: Colors.white),
          ]),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'An email has been sent to ${user.email} please verify',
              style: TextStyle(
                  backgroundColor: Colors.amber,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> checkEmailVerified() async {
    user = auth.currentUser;
    await user.reload();
    if (user.emailVerified) {
      timer.cancel();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }
}
