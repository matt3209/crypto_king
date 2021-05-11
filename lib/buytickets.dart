import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_king/index.dart';
import 'package:crypto_king/main.dart';
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
  final int totalTickets = 100;
  int _currentValue = 1;
  int counter = 0;
  int indexChecker = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        Image(image: AssetImage('assets/images/map.png')),

        // this is a discrete number selected for tickets sold. currently
        // we only allow the purchase of maximum 5 tickets, with a minimum of
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
                title: Text("Confirm Ticket Purchase",
                    style: TextStyle(color: Colors.black)),
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
                    child:
                        Text("Cancel", style: TextStyle(color: Colors.black)),
                    color: Colors.orange,
                  ),

                  // if a user decides to complete their purchase, they can click confirm.
                  // when a user confirms their purchase we let them know if it was successful
                  // if it was successful, we return them to the app screen they accessed
                  // purchase tickets from

                  // ignore: deprecated_member_use
                  FlatButton(
                    onPressed: () async {
                      List tickets = await _getUserTickets();
                      indexChecker = await _getIndex();
                      int available = totalTickets + 1 - indexChecker;
                      if (indexChecker + _currentValue > 101) {
                        // dialog box for if the user selects to purchase more tickets than
                        // are available in the game.
                        return showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text('Error'),
                            content: Text(
                                'There are only $available tickets available. Please select the correct number of tickets.'),
                            actions: <Widget>[
                              // ignore: deprecated_member_use
                              FlatButton(
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                  Navigator.of(ctx).pop();
                                },
                                child: Text(
                                  "Return to App",
                                  style: TextStyle(color: Colors.black),
                                ),
                                color: Colors.orange,
                              ),
                            ],
                          ),
                        );
                      } else if (tickets.length >= 5) {
                        // dialog box for if the user already has the max of 5 tickets.
                        return showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text('Error'),
                            content: Text('You already have max tickets of 5.'),
                            actions: <Widget>[
                              // ignore: deprecated_member_use
                              FlatButton(
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                  Navigator.of(ctx).pop();
                                },
                                child: Text("Return to App",
                                    style: TextStyle(color: Colors.black)),
                                color: Colors.orange,
                              ),
                            ],
                          ),
                        );
                      } else if (tickets.length + _currentValue > 5) {
                        int checkTicket = 5 - tickets.length;

                        // dialog box for if the user has selected a number of tickets
                        // that will put them over the 5 ticket limit.
                        return showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text('Error'),
                            content: Text(
                                'You can only purchase up to $checkTicket tickets.'),
                            actions: <Widget>[
                              // ignore: deprecated_member_use
                              FlatButton(
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                  Navigator.of(ctx).pop();
                                },
                                child: Text("Return to App",
                                    style: TextStyle(color: Colors.black)),
                                color: Colors.orange,
                              ),
                            ],
                          ),
                        );
                      } else {
                        await _buyTickets();

                        // dialog box that tells the user how many tickets they've acquired.
                        return showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text('Success!'),
                            content:
                                Text('You have acquired $counter tickets.'),
                            actions: <Widget>[
                              // ignore: deprecated_member_use
                              FlatButton(
                                onPressed: () {
                                  counter = 0;
                                  Navigator.of(ctx).pop();
                                  Navigator.of(ctx).pop();
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) => MyHomePage()));
                                },
                                child: Text("Return to App",
                                    style: TextStyle(color: Colors.black)),
                                color: Colors.orange,
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    child: Text("Get Tickets",
                        style: TextStyle(color: Colors.black)),
                    color: Colors.orange,
                  ),
                ],
              ),
            );
          },
          child: Text('Get Tickets'),
          style: ElevatedButton.styleFrom(
            primary: Colors.orange,
            onPrimary: Colors.black,
          ),
        ),
      ],
    ));
  }

  // this allows the user to buy tickets and populates their document in
  // the firebase collection
  _buyTickets() async {
    CollectionReference tickets =
        FirebaseFirestore.instance.collection('tickets');
    DocumentSnapshot currentIndex = await tickets.doc('number').get();
    int index = currentIndex['index'];
    var _currentUID = FirebaseAuth.instance.currentUser.uid;
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    for (int i = 0; index <= totalTickets && i < _currentValue; i++) {
      await users.doc(_currentUID).update({
        'Ticket List': FieldValue.arrayUnion([index])
      });
      await tickets.doc('number').update({'index': index + 1});
      counter++;
      index++;
    }
    globalIndex = index - 1;
  }

  // this method gets the index of the ticket that we are currently on.
  // we are able to track which is the next ticket to issue by finding this
  // index.
  Future<int> _getIndex() async {
    CollectionReference tickets =
        FirebaseFirestore.instance.collection('tickets');
    DocumentSnapshot currentIndex = await tickets.doc('number').get();
    int index = currentIndex['index'];
    return index;
  }

  // this gets the list of all the tickets the current user owns
  Future<List> _getUserTickets() async {
    var _currentUID = FirebaseAuth.instance.currentUser.uid;

    CollectionReference users = FirebaseFirestore.instance.collection('users');
    DocumentSnapshot userlist = await users.doc(_currentUID).get();

    List buckets = userlist['Ticket List'];

    return buckets;
  }
}
