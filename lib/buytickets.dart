import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text("Purchase Tickets",
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
          maxValue: 100,
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
                      "Are you sure you want to purchase $_currentValue tickets?"),
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
                                'You have purchased $_currentValue tickets.'),
                            actions: <Widget>[
                              // ignore: deprecated_member_use
                              FlatButton(
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                  Navigator.of(ctx).pop();
                                  Navigator.of(ctx).pop();
                                },
                                child: Text("Return to App"),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Text("Purchase"),
                    ),
                  ],
                ),
              );
            },
            child: Text('Purchase')),
      ],
    ));
  }
}
