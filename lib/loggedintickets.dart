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
    //CollectionReference tickets =
    //FirebaseFirestore.instance.collection('tickets');

    //DocumentSnapshot currentIndex = await tickets.doc('number').get();
    //int index = currentIndex['index'];

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
              "0xLOTTO",
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
                              return ListTile(
                                title: Text(snapshot.data[index].toString()),
                              );
                            });
                      }
                      return Container(child: Text('loading...'));
                    })),

            // this is a button to allow the user to purchase more tickets
            new Container(
              padding: const EdgeInsets.only(top: 515, right: 20.0, left: 300),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SecondRoute()));
                },
                child: Text('Buy Tickets'),
              ),
            )
          ],
        ))));
  }

  // _getUserTickets() async {
  //   var _currentUID = FirebaseAuth.instance.currentUser.uid;

  //   CollectionReference users = FirebaseFirestore.instance.collection('users');
  //   DocumentSnapshot userlist = await users.doc(_currentUID).get();

  //   List<int> buckets = List.castFrom(userlist['Tickets List']);
  //   print(buckets);

  //   return buckets;

}
