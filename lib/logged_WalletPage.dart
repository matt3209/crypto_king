import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_king/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// this page will show the user their information.
// full name
// ethereum address
// tickets owned

FirebaseAuth auth = FirebaseAuth.instance;

class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _currentUID = FirebaseAuth.instance.currentUser.uid;
    return Scaffold(
        body: ListView(children: [
      Column(children: [
        StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(_currentUID)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return new Text("Loading");
              }
              var userDocument = snapshot.data;
              return Column(children: [
                Container(
                  child: Image(
                      image: AssetImage('assets/images/map.png'), height: 200),
                ),

                // USER NAME START
                // display the user name
                Container(
                  margin: const EdgeInsets.all(5.0),
                  padding: const EdgeInsets.all(15.0),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.orange)),
                  child: Text(
                      "User's Name: ${userDocument['First Name']} ${userDocument['Last Name']}",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold)),
                ),

                // USER ADDRESS
                // display the user ethereum address
                Container(
                  margin: const EdgeInsets.all(5.0),
                  padding: const EdgeInsets.all(15.0),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.orange)),
                  child: Text("Ethereum Address: ${userDocument['Ethereum']}",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold)),
                ),

                // USER TICKETS OWNED
                // display the tickets owned
                Container(
                  margin: const EdgeInsets.all(5.0),
                  padding: const EdgeInsets.all(15.0),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.orange)),
                  child: Text(
                      "Total Tickets Owned: ${userDocument['Ticket List'].length}",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold)),
                )
              ]);
            }),

        // USER LOGOUT BUTTON
        // display the logout button
        Center(
          child: ElevatedButton(
            child: Text('Logout User'),
            style: ElevatedButton.styleFrom(
              onPrimary: Colors.black,
              primary: Colors.orange,
            ),
            onPressed: () async {
              await _signOut(context); //signout user
            },
          ),
        )
      ])
    ]));
  }

  // method to logout the current user and return them to the login screen.
  _signOut(context) async {
    await auth.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
