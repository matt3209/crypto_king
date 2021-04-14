import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text("Get Tickets",
              style: TextStyle(color: Colors.orangeAccent))),
      body: _IntegerExample(),
    );
  }
}

class _IntegerExample extends StatefulWidget {
  @override
  __IntegerExampleState createState() => __IntegerExampleState();
}

class __IntegerExampleState extends State<_IntegerExample> {
  int _currentValue = 1;
  var _currentUID = FirebaseAuth.instance.currentUser.uid;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        Image(image: AssetImage('assets/images/map.png')),

        // this is a discrete number selected for tickets sold. currently
        // we only allow the purchase of maximum 100 tickets, with a minimum of
        // 1 ticket needed to purchase.
        NumberPicker(
          value: _currentValue,
          minValue: 1,
          maxValue: 5,
          onChanged: (value) => setState(() => _currentValue = value),
        ),
        Text('Current Ticket Amount: $_currentValue'),

        // our ticket purchase has confirmation. upon a users selecting 'Purchase'
        // they will be prompted if they want to complete the purchase.
        ElevatedButton(
            onPressed: () {
              return showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text("Confirm Ticket Purchase"),
                  content: Text(
                      "Are you sure you want to acquire $_currentValue tickets?"),
                  actions: <Widget>[
                    // a user can chose to 'Cancel' their purchase before finalizing
                    // if they do this we return them to the purchase tickets page

                    // ignore: deprecated_member_use
                    FlatButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Text("Cancel"),
                    ),

                    // if a user decides to complete their purchase, they can click confirm.
                    // when a user confirms their purchase we let them know if it was successful
                    // if it was successful, we return them to the app screen they accessed
                    // purchase tickets from

                    // ignore: deprecated_member_use
                    FlatButton(
                      onPressed: () {
                        return showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text('Success!'),
                            content: Text(
                                'You have acquired $_currentValue tickets.'),
                            actions: <Widget>[
                              // ignore: deprecated_member_use
                              FlatButton(
                                onPressed: () {
                                  _buyTickets();
                                  Navigator.of(ctx).pop();
                                  Navigator.of(ctx).pop();
                                },
                                child: Text("Return to App"),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Text("Get Tickets"),
                    ),
                  ],
                ),
              );
            },
            child: Text('Get Tickets')),
      ],
    ));
  }

  _buyTickets() async {
    CollectionReference tickets =
        FirebaseFirestore.instance.collection('tickets');

    DocumentSnapshot currentIndex = await tickets.doc('number').get();
    int index = currentIndex['index'];

    var _currentUID = FirebaseAuth.instance.currentUser.uid;
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    for (int i = index; i < index + _currentValue; i++) {
      await users.doc(_currentUID).update({
        'Ticket List': FieldValue.arrayUnion([i])
      });
      await tickets.doc('number').update({'index': i});
    }
  }
}
