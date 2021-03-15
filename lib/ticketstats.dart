import 'package:flutter/material.dart';

class TicketStats extends StatelessWidget {
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
        child: Column(children: <Widget>[
          Image(image: AssetImage('assets/images/dots.png')),
          Text(
              'We will have similar graphics like this that will show the users statistical data about the lottery. (For example the graphic above would show number tickets available vs sold.)',
              style: TextStyle(fontSize: 18))
        ]),
      ),
    );
  }
}
