import 'package:crypto_king/signUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:crypto_king/main.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email, _password;
  final auth = FirebaseAuth.instance; //creating instance

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(0, 75, 0, 0),
            child: Image(
              image: AssetImage('assets/images/map.png'),
              height: 300,
            )),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
          child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(hintText: 'Email'),
              onChanged: (value) {
                setState(() {
                  //setting email state
                  _email = value.trim();
                });
              }),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(hintText: 'Password'),
            onChanged: (value) {
              //setting password state
              setState(() {
                _password = value.trim();
              });
            },
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          ElevatedButton(
            child: Text('Sign in'),
            onPressed: () => _signin(_email, _password),
            style: ElevatedButton.styleFrom(
              primary: Colors.orangeAccent, // background
              onPrimary: Colors.black, // foreground
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orangeAccent, // background
                onPrimary: Colors.black, // foreground
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()));
              },
              child: Text('Sign up'))
        ])
      ],
    ));
  }

  _signin(String _email, String _password) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: _email, password: _password); //Sign in the user.

      //success
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => MyHomePage())); // on success go to homescreen
    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(msg: error.message, gravity: ToastGravity.TOP);
    }
  }

/*
  _signUp(String _email, String _password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: _email, password: _password); //create the user

      //success
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MyHomePage()));
    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(msg: error.message, gravity: ToastGravity.TOP);
    }
  }
 */
}
