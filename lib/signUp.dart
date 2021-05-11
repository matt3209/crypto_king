import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:crypto_king/main.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String _email, _password, _firstName, _lastName, _ethereum;
  final auth = FirebaseAuth.instance; //creating instance

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: ListView(
      children: [
        Column(children: [
          // LOGO BEGIN
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Image(
                image: AssetImage('assets/images/map.png'),
                height: 270,
              )),

          // USER FIRST NAME INPUT
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(hintText: 'First Name'),
                onChanged: (value) {
                  setState(() {
                    //setting name state
                    _firstName = value.trim();
                  });
                }),
          ),

          // USER LAST NAME INPUT
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(hintText: 'Last Name'),
                onChanged: (value) {
                  setState(() {
                    //setting last name state
                    _lastName = value.trim();
                  });
                }),
          ),

          // USER EMAIL INPUT
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
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

          // USER PASSWORD INPUT
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

          // USER ETHEREUM INPUT
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(hintText: 'Ethereum Address'),
                onChanged: (value) {
                  setState(() {
                    //setting name state
                    _ethereum = value.trim();
                  });
                }),
          ),

          // USER SIGNUP BUTTON
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.orangeAccent, // background
                  onPrimary: Colors.black, // foreground
                ),
                onPressed: () => _signUp(_email, _password),
                child: Text('Sign up'))
          ])
        ])
      ],
    )));
  }

  // method to help user sign up.
  _signUp(String _email, String _password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: _email, password: _password); //create the user

      var _currentUID = FirebaseAuth.instance.currentUser.uid;

      await users.doc(_currentUID).set({
        'Ethereum': _ethereum,
        'First Name': _firstName,
        'Last Name': _lastName,
        'Ticket List': []
      });

      //success
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MyHomePage()));
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
