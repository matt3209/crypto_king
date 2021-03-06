import 'package:crypto_king/signUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:crypto_king/main.dart';

// login class to handle user logins.

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
        // LOGO
        Padding(
            padding: const EdgeInsets.fromLTRB(0, 75, 0, 0),
            child: Image(
              image: AssetImage('assets/images/map.png'),
              height: 300,
            )),

        // EMAIL INPUT
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

        // PASSWORD INPUT
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

        // SIGN UP BUTTON
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

  // method to actually sign the user into the app.
  _signin(String _email, String _password) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: _email, password: _password); //Sign in the user.

      //success
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => MyHomePage())); // on success go to homescreen
    } on FirebaseAuthException catch (error) {
      Toast.show(
          error.message != null
              ? error.message
              : 'Make sure to enter an email and password',
          context,
          duration: Toast.LENGTH_SHORT,
          gravity: Toast.TOP);
    }
  }
}
