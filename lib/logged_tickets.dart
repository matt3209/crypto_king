import 'package:crypto_king/loggedintickets.dart';
import 'package:flutter/material.dart';

class LotteryTickets extends StatelessWidget {
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
                child: Column(
          children: [
            Container(
                child: Column(children: <Widget>[
              Text(
                  'To view your tickets for this lottery please log into your crypto wallet by going to the wallet tab. Login functionality to come.'),
              ElevatedButton(
                onPressed: () {},
                child: Text('Login'),
              ),
            ])),
            Container(
                child: Column(children: <Widget>[
              Text(
                  'Prof Rogers - to view what a user would see when they are actually logged in, click the button below.'),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TicketLoggedIn()));
                },
                child: Text('Logged-In User View'),
              ),
              Image(image: AssetImage('assets/images/pie-chart.png'))
            ])),
          ],
        ))));
  }
}
