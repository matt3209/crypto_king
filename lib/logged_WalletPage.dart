import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_king/login.dart';
import 'package:crypto_king/walletlogin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

var _currentUID = FirebaseAuth.instance.currentUser.uid;

class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    final auth = FirebaseAuth.instance;
    return Scaffold(
        body: ListView(children: [
      Column(children: [
        FutureBuilder<DocumentSnapshot>(
          future: users.doc(_currentUID).get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text("Something went wrong");
            }

            if (snapshot.hasData && !snapshot.data.exists) {
              return Text("Document does not exist");
            }

            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data = snapshot.data.data();
              String name = data['First name'];

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
                      "User's Name: ${data['First Name']} ${data['Last Name']}",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold)),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  padding: const EdgeInsets.all(15.0),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.orange)),
                  child: Text("Ethereum Address: ${data['Ethereum']}",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold)),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  padding: const EdgeInsets.all(15.0),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.orange)),
                  child: Text(
                      "Total Tickets Owned: ${data['Ticket List'].length}",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold)),
                ),

/*
                TextField(
                  enabled: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText:
                        "User's Name: ${data['First Name']} ${data['Last Name']}",
                  ),
                ),
                SizedBox(
                  height: 16,
                ),),
                TextField(
                  enabled: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Ethereum Address: ${data['Ethereum']}",
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  decoration: InputDecoration(
                    enabled: false,
                    border: OutlineInputBorder(),
                    labelText:
                        "Total Tickets Owned: ${data['Ticket List'].length}",
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                */
              ]);
            }

            return Text("loading");
          },
        ),
      ]),
      Center(
        child: ElevatedButton(
          child: Text('Logout User'),
          onPressed: () {
            auth.signOut(); //signout user
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginScreen()));
          },
        ),
      )
    ]));
  }
}
