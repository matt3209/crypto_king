import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_king/login.dart';
import 'package:crypto_king/main.dart';
import 'package:crypto_king/walletlogin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


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
              //return new Text(userDocument["First Name"]);
              return Column(children: [
                Container(
                  child: Image(
                      image: AssetImage('assets/images/map.png'), height: 200),
                ),
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
                Container(
                  margin: const EdgeInsets.all(5.0),
                  padding: const EdgeInsets.all(15.0),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.orange)),
                  child: Text("Ethereum Address: ${userDocument['Ethereum']}",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold)),
                ),
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
        Center(
          child: ElevatedButton(
            child: Text('Logout User'),
            style: ElevatedButton.styleFrom(
              onPrimary: Colors.black, // background
              primary: Colors.orange, // foreground
            ),
            onPressed: () async {
              await _signOut(context); //signout user
            },
          ),
        )
      ])
    ]));
  }

  _signOut(context) async {
    await auth.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }



}
