import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text("Purchase Tickets",
              style: TextStyle(color: Colors.yellowAccent))),
      body: _IntegerExample(),
    );
  }
}

class _IntegerExample extends StatefulWidget {
  @override
  __IntegerExampleState createState() => __IntegerExampleState();
}

class __IntegerExampleState extends State<_IntegerExample> {
  int _currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        Image(image: AssetImage('assets/images/map.png')),
        NumberPicker(
          value: _currentValue,
          minValue: 0,
          maxValue: 100,
          onChanged: (value) => setState(() => _currentValue = value),
        ),
        Text('Current Tickets Selected: $_currentValue'),
        ElevatedButton(
            onPressed: () {
              return showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text("Confirm Ticket Purchase"),
                  content: Text(
                      "Are you sure you want to purchase $_currentValue tickets?"),
                  actions: <Widget>[
                    // ignore: deprecated_member_use
                    FlatButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Text("Cancel"),
                    ),
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
