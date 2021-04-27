import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_king/walletlogin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

var _currentUID = FirebaseAuth.instance.currentUser.uid;

class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
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
          return Column(children: [
            Text("Full Name: ${data['First Name']} ${data['Last Name']}"),
            Text("Ethereum Address: ${data['Ethereum']}"),
          ]);
        }

        return Text("loading");
      },
    );
  }
}
