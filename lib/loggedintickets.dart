import 'package:flutter/material.dart';
import 'package:crypto_king/buytickets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TicketLoggedIn extends StatelessWidget {
  // this array will become dynamic for each user. for now, we wanted to show
  // you what a user would view when they are logged in. these are the tickets
  // that would display a user 'owns'.
  final tickets = ['Your Owned Tickets', '0001', '0002', '0003', '0004'];

  Future<dynamic> _getUserTickets() async {

    var _currentUID = FirebaseAuth.instance.currentUser.uid;

    CollectionReference users = FirebaseFirestore.instance.collection('users');
    DocumentSnapshot userlist = await users.doc(_currentUID).get();

    List buckets = userlist['Ticket List'];

    return buckets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black87,
            title: Text(
              "Your Tickets",
              style: TextStyle(
                color: Colors.orangeAccent,
              ),
            )),
        body: Center(
            child: Container(
                child: new Stack(
          children: [
            // list of user tickets starts here.
            new Container(
                child: FutureBuilder(
                    future: _getUserTickets(),
                    builder: (context, snapshot) {
                      if (snapshot.data != null) {
                        return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return Card(
                                color: Colors.orange[200],
                                elevation: 5,
                                shadowColor: Colors.orange,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    ListTile(
                                      title: Text('Ticket Number: ' +
                                          snapshot.data[index].toString()),
                                    ),
                                  ],
                                ),
                              );
                            });
                      }
                      return Container(
                          child: Text('Loading your list of tickets...'));
                    })),

            // this is a button to allow the user to purchase more tickets
            new Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(
                top: 300,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SecondRoute()));
                },
                child: Text('Get Tickets'),
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.black, // background
                  primary: Colors.orange, // foreground
                ),
              ),
            )
          ],
        ))));
  }
}
