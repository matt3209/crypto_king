import 'package:flutter/material.dart';

class GameInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text(
            "Game Info",
            style: TextStyle(
              color: Colors.orangeAccent,
            ),
          )),
      body: Column(children: <Widget>[Row()]),
    );
  }
}
